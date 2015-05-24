package com.ping.dao;

import com.tianex.pinenjoy.dao.AccountDao;
import com.tianex.pinenjoy.domain.Account;
import junit.framework.Assert;
import org.junit.Test;
import org.unitils.dbunit.annotation.DataSet;
import org.unitils.dbunit.annotation.ExpectedDataSet;
import org.unitils.spring.annotation.SpringBean;

/**
 * 用户账户测试类
 * @author eric
 */
public class AccountDaoTest extends BaseDaoTest {

    @SpringBean("accountDao")
    private AccountDao accountDao;

    /**
     * 测试添加用户模块
     */
    @Test
    @ExpectedDataSet("pp.ExpectedAccount.xls")
    public void addAccount() {
        //List<Account> accounts = XlsDataSetBeanFactory.createBeas();

        //for (Account account : accounts) {
            //accountDao.save(account);
        //}
    }

    /**
     * 测试删除用户模块
     */
    @Test
    @DataSet("pp.account.xls") //准备测试数据
    @ExpectedDataSet("pp.expectedAccount.xls") //准备验证测试数据
    public void removeAccount() {
        Account account = accountDao.get(3);
        accountDao.delete(account);
    }

    /**
     * 测试加载模块
     */
    @Test
    @DataSet("pp.account.xls")
    public void getAccount() {
        Account account = accountDao.load(1);

        //验证结果
        Assert.assertNotNull(account);
        //Assert.assertThat(account.getNickName(), Matchers.containsString(""));
    }


}
