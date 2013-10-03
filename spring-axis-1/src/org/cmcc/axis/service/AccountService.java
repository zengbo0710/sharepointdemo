/**
 * 2008-7-8
 */
package org.cmcc.axis.service;

import org.cmcc.axis.domain.Account;

/**
 * description: AccountService<br>
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public interface AccountService {

	/**
	 * SignIn
	 * 
	 * @param account
	 *            Product ID
	 * @return
	 */
	Account accountSignUpByAuto(Account account);

}
