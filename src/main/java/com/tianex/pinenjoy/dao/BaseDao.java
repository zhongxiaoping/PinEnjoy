package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.core.Page;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * DAO层的基类，封装了常用的DAO操作方法，所有的DAO类都要继承它
 * @author TianEx
 */
public class BaseDao<E> {

    private Class<E> entityClass;

    protected HibernateTemplate hibernateTemplate;

    /**
     * 默认的构造方法
     * 通过反射获取子类确定泛型类
     */
    public BaseDao() {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        entityClass = (Class) params[0];
    }

    /**
     * 根据ID加载PO实例
     * @param id
     * @return
     */
    public E load(Serializable id) {
        return (E) hibernateTemplate.load(entityClass, id);
    }

    public E get(Serializable id) {
        return (E) hibernateTemplate.get(entityClass, id);
    }

    /**
     * 对延迟加载的实体PO执行初始化
     * @param entity
     */
    public void initialize(Object entity) {
        hibernateTemplate.initialize(entity);
    }

    /**
     * 获取PO的所有对象
     * @return
     */
    public List<E> loadAll() {
        return hibernateTemplate.loadAll(entityClass);
    }

    /**
     * 保存PO
     * @param entity
     */
    public void save(E entity) {
        hibernateTemplate.save(entity);
    }

    /**
     * 删除PO
     * @param entity
     */
    public void delete(E entity) {
        hibernateTemplate.delete(entity);
    }

    /**
     * 更改PO
     * @param entity
     */
    public void update(E entity) {
        hibernateTemplate.update(entity);
    }

    /**
     * 执行HQL查询
     * @param hql
     * @return
     */
    public List<E> find(String hql) {
        return (List<E>) hibernateTemplate.find(hql);
    }

    /**
     * 执行带参数的HQL查询
     * @param hql
     * @param params
     * @return
     */
    public List<E> find(String hql, Object... params) {
        return (List<E>) hibernateTemplate.find(hql, params);
    }


    /**
     * 分页查询函数，使用HQL
     * @param hql
     * @param pageNo
     * @param pageSize
     * @param values
     * @return
     */
    public Page<E> pagedQuery(String hql, int pageNo, int pageSize, Object... values) {
        Assert.hasText(hql);
        Assert.isTrue(pageNo >= 1, "当前页编号不可小于 1");

        //Count查询
        String countQueryString = "select count(*) " + removeSelect(removeOrderBy(hql));
        long totalCount = (Long) hibernateTemplate.find(countQueryString, values).get(0);
        if (totalCount < 1) {
            return new Page<E>();
        }

        //实际查询返回分页对象
        int startIndex = Page.getStartOfPage(pageNo, pageSize);

        Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        if (values.length > 0) {
            for (int i = 0; i < values.length; i++) {
                query.setParameter(i, values[i]);
            }
        }

        query.setMaxResults(pageSize);
        List<E> list = query.setFirstResult(startIndex).list();

        return new Page<E>(pageNo, pageSize, startIndex, list);
    }

    /**
     * 去除hql的select子句
     * @param hql
     * @return
     * */
    private static String removeSelect(String hql) {
        Assert.hasText(hql);
        int beginPos = hql.toLowerCase().indexOf("from");
        Assert.isTrue(beginPos != -1, "hql:" + hql + "must has a keyword 'from'");
        return hql.substring(beginPos);
    }

    /**
     * 去除hql的orderby子句
     * @param hql
     * @return
     */
    private static String removeOrderBy(String hql) {
        Assert.hasText(hql);
        Pattern pattern = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(hql);
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sb, "");
        }
        matcher.appendTail(sb);
        return sb.toString();
    }

    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
}
