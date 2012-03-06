package com.sharepoint.demo.util;

import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MainConstants {
	public static final Integer NOT_STARTED_KEY = 1;
	public static final Integer IN_PROGRESS_KEY = 2;
	public static final Integer COMPLETED_KEY = 3;
	public static final Integer DEFERRED_KEY = 4;
	public static final Integer WAITING_ON_SOMEONE_ELSE_KEY = 5;
	public static final String NOT_STARTED_VALUE = "Not Started";
	public static final String IN_PROGRESS_VALUE = "In Progress";
	public static final String COMPLETED_VALUE = "Completed";
	public static final String DEFERRED_VALUE = "Deferred";
	public static final String WAITING_ON_SOMEONE_ELSE_VALUE = "Waiting on someone else";

	public static final Integer TYPE1_KEY = 1;
	public static final Integer TYPE2_KEY = 2;
	public static final String TYPE1_VALUE = "One";
	public static final String TYPE2_VALUE = "Two";
	
	public static final String LOCAL_PATH = "/SharePointDemo/upload/";

	public static Map<Integer, String> statusMap = new LinkedHashMap<Integer, String>();
	public static Map<Integer, String> typeMap = new LinkedHashMap<Integer, String>();

	static {
		statusMap.put(NOT_STARTED_KEY, NOT_STARTED_VALUE);
		statusMap.put(IN_PROGRESS_KEY, IN_PROGRESS_VALUE);
		statusMap.put(COMPLETED_KEY, COMPLETED_VALUE);
		statusMap.put(DEFERRED_KEY, DEFERRED_VALUE);
		statusMap.put(WAITING_ON_SOMEONE_ELSE_KEY, WAITING_ON_SOMEONE_ELSE_VALUE);

		typeMap.put(TYPE1_KEY, TYPE1_VALUE);
		typeMap.put(TYPE2_KEY, TYPE2_VALUE);
	}

	/*
	 * @return true---是Windows操作系统
	 */
	public static boolean isWindowsOS() {
		boolean isWindowsOS = false;
		String osName = System.getProperty("os.name");
		if (osName.toLowerCase().indexOf("windows") > -1) {
			isWindowsOS = true;
		}
		return isWindowsOS;
	}

	public static String getUploadPath(int port) {
		String ip = "";
		boolean isWindows = isWindowsOS();
		try {
			if (isWindows) {
				InetAddress address = InetAddress.getLocalHost();
				ip = address.getHostAddress();
			} else {
				ip = SystemTools.getLinuxIP();
			}
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String savePath = "http://" + ip + ":" + port + LOCAL_PATH; // 保存到数据库的地址,图片上传到服务器端
		return savePath;
	}
}
