/**
 * 2008-7-4
 */
package org.cmcc.axis;

import static org.junit.Assert.*;

import java.net.URL;
import java.util.Random;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.junit.Before;
import org.junit.Test;

/**
 * WebService Junit
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public class WebServiceTest {
	private String nameSpaceUri = "http://localhost:8080/axis/services/WebService";
	private String wsdlUrl = nameSpaceUri + "?wsdl";

	private Service service;
	private Call call;

	@Before
	public final void init() throws Exception {
		// Create service
		service = new Service();
		call = (Call) service.createCall();

		// Call Remote function
		call.setOperationName(new QName(nameSpaceUri, "add"));

		// Set URL
		call.setTargetEndpointAddress(new URL(wsdlUrl));
	}

	@Test
	public final void testAdd() throws Exception {
		
		// Set value
		Random rnd = new Random();

		int a = rnd.nextInt(100);

		int b = rnd.nextInt(100);

		// execute remote calls, and get the return value
		String r = (String) call.invoke(new Object[] { a, b });

		assertEquals(String.valueOf(a + b), r);
		System.out.println("a(" + a + ") + b(" + b + ") = " + r);

	}
}
