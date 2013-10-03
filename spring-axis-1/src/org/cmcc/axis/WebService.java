/**
 * 2008-7-4
 */
package org.cmcc.axis;

import javax.xml.rpc.ServiceException;

import org.cmcc.axis.service.CalcService;
import org.springframework.context.ApplicationContext;
import org.springframework.remoting.jaxrpc.ServletEndpointSupport;

/**
 * WebService Main function
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public class WebService extends ServletEndpointSupport {

	private ApplicationContext applicationContext;
	private CalcService calcService;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.remoting.jaxrpc.ServletEndpointSupport#onInit()
	 */
	@Override
	protected void onInit() throws ServiceException {
		// Initial Spirng Configuration
		applicationContext = super.getApplicationContext();

		calcService = (CalcService) applicationContext.getBean("calcService");

	}

	/**
	 * Sum
	 * 
	 * @param a
	 * @param b
	 * @return
	 */
	public String add(int a, int b) {
		return String.valueOf(calcService.add(a, b));
	}

}
