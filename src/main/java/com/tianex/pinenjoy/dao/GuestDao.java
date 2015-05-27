package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Guest;
import com.tianex.pinenjoy.util.DateUtils;
import com.tianex.pinenjoy.util.NumberUtils;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("guestDao")
public class GuestDao extends BaseDao<Guest> {

    public static final String GUEST_ALL_ACCOUNTNICKNAME = "from Guest g where g.guestAccountNickname=?";

    public List<Guest> findAllByAccountNickname(String accountNickname) {
        List<Guest> guestList = super.find(GUEST_ALL_ACCOUNTNICKNAME, accountNickname);
        if (guestList.size() <= 0) {
            return null;
        }

        return guestList;
    }

    public Page<Guest> pageQueryByAccountNickname(int pageNo, int pageSize, String accountNickname) {
        return super.pagedQuery(GUEST_ALL_ACCOUNTNICKNAME, pageNo, pageSize, accountNickname);
    }

}
