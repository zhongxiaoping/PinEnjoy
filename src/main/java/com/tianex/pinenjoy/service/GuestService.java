package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Guest;

import java.util.List;

public interface GuestService {

    List<Guest> findAllByAccountNickname(String accountNickname);

    void logGuestSuccess(Account currentAccount, Account homeAccount);
}
