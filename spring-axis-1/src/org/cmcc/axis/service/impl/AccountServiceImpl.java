/**
 * 2008-7-8
 */
package org.cmcc.axis.service.impl;

import java.util.Date;

import org.cmcc.axis.domain.Account;
import org.cmcc.axis.service.AccountService;

/**
 * Register adapter<br>
 * multiple Service verify
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public class AccountServiceImpl implements AccountService {

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.cmcc.axis.service.AccountService#accountSignUpByAuto(cn.
	 * v8.v8account.domain.Account)
	 */
	@Override
	public Account accountSignUpByAuto(Account account) {
		// Create user
		account.setName("a");
		account.setPassword("b");
		account.setSignDate(new Date(System.currentTimeMillis()));
		return account;

	}

}
