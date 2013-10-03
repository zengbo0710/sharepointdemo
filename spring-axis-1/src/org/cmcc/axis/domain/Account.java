/**
 * 2008-7-4
 */
package org.cmcc.axis.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Account
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public class Account implements Serializable {
	private static final long serialVersionUID = 5786330758047410074L;
	private long id;
	private String name;
	private String password;
	private Date signDate;
	private boolean online;

	/**
	 * @return the online
	 */
	public boolean isOnline() {
		return online;
	}

	/**
	 * @param online
	 *            the online to set
	 */
	public void setOnline(boolean online) {
		this.online = online;
	}

	/**
	 * @return the signDate
	 */
	public Date getSignDate() {
		return signDate;
	}

	/**
	 * @param signDate
	 *            the signDate to set
	 */
	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

}
