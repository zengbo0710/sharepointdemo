/**
 * 2008-7-10
 */
package org.cmcc.axis.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.cmcc.axis.domain.Account;
import org.cmcc.axis.wsdl.Model;
import org.cmcc.axis.wsdl.ModelUtils;

/**
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public class AccountModel implements Model<Account> {
	public static final String KEY_ACCOUNT_ID = "accountId";
	public static final String KEY_ACCOUNT_NAME = "accountName";
	public static final String KEY_ACCOUNT_PASSWORD = "accountPassword";
	public static final String KEY_ACCOUNT_ONLINE = "accountOnline";
	public static final String KEY_ACCOUNT_SIGN_DATE = "accountSignDate";

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.cmcc.axis.wsdl.Model#toModel(java.lang.Object)
	 */
	@Override
	public Map<String, Object> toModel(Account account) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put(KEY_ACCOUNT_ID, account.getId());
		model.put(KEY_ACCOUNT_NAME, account.getName());
		model.put(KEY_ACCOUNT_PASSWORD, account.getPassword());
		model.put(KEY_ACCOUNT_ONLINE, account.isOnline());
		model.put(KEY_ACCOUNT_SIGN_DATE, account.getSignDate());

		return model;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.cmcc.axis.wsdl.Model#toObject(java.util.Map)
	 */
	@Override
	public Account toObject(Map<String, Object> model) {
		Account account = new Account();
		account.setId(ModelUtils.getLongParameter(model, KEY_ACCOUNT_ID));
		account.setName(ModelUtils.getStringParameter(model, KEY_ACCOUNT_NAME,
				null));
		account.setPassword(ModelUtils.getStringParameter(model,
				KEY_ACCOUNT_PASSWORD, null));
		account.setOnline(ModelUtils.getBooleanParameter(model,
				KEY_ACCOUNT_ONLINE, true));
		account.setSignDate((Date) model.get(KEY_ACCOUNT_SIGN_DATE));

		return account;
	}
}
