/**
 * 2008-7-8
 */
package org.cmcc.axis.service.impl;

import org.cmcc.axis.service.CalcService;

/**
 * Calculate
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public class CalcServiceImpl implements CalcService {

	@Override
	public int add(int a, int b) {
		return a + b;
	}

}
