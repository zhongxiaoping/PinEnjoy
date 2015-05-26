package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.dao.GuestDao;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Guest;
import com.tianex.pinenjoy.service.GuestService;
import com.tianex.pinenjoy.util.DateUtils;
import com.tianex.pinenjoy.util.NumberUtils;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("guestService")
public class GuestServiceImpl implements GuestService {

    private GuestDao guestDao;

    /**
     * �����û�����ȡ���з�������ҳ�ķÿ�ʵ��
     * @param accountNickname
     * @return
     */
    public List<Guest> findAllByAccountNickname(String accountNickname) {
        return guestDao.findAllByAccountNickname(accountNickname);
    }

    /**
     * ����ǰ�ÿͼ�¼����ǰ��ҳ�û�
     * @param currentAccount
     * @param homeAccount
     */
    public void logGuestSuccess(Account currentAccount, Account homeAccount) {
        Guest guest = new Guest();
        guest.setGuestId(NumberUtils.generateUUID());
        guest.setGuestAccountNickname(currentAccount.getAccountNickname());
        guest.setGuestAccountThumb(currentAccount.getAccountThumb());
        guest.setGuestLastVisitedTime(DateUtils.getNowByTimestamp());
        guest.setHomeAccountNickname(homeAccount.getAccountNickname());

        guestDao.save(guest);
    }

    @Resource
    public void setGuestDao(GuestDao guestDao) {
        this.guestDao = guestDao;
    }
}
