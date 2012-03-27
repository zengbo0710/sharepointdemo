package com.maintenance.demo.util;

import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MainConstants {
	public static final Long NOT_STARTED_KEY = 1l;
	public static final Long IN_PROGRESS_KEY = 2l;
	public static final Long COMPLETED_KEY = 3l;
	public static final Long DEFERRED_KEY = 4l;
	public static final Long WAITING_ON_SOMEONE_ELSE_KEY = 5l;
	
	public static final Long ADMIN_KEY = 1l;
	public static final Long BOSS_KEY = 2l;
	public static final Long SUPERVISOR_KEY = 3l;
	public static final Long TECHNICIAN_KEY = 4l;
	
	public static final Long APPROVED_KEY = 1l;
	public static final Long REJECT_KEY = 2l;
	
	public static final Long TYPE1_KEY = 1l;
	public static final Long TYPE2_KEY = 2l;
	
	public static final String NOT_STARTED_VALUE = "Not Started";
	public static final String IN_PROGRESS_VALUE = "In Progress";
	public static final String COMPLETED_VALUE = "Completed";
	public static final String DEFERRED_VALUE = "Deferred";
	
	public static final String APPROVED_VALUE = "approved";
	public static final String REJECT_VALUE = "Reject";
	
	public static final String WAITING_ON_SOMEONE_ELSE_VALUE = "Waiting on someone else";

	
	public static final String TYPE1_VALUE = "One";
	public static final String TYPE2_VALUE = "Two";
	
	public static final String ADMIN_VALUE = "Admin";
	public static final String BOSS_VALUE = "Boss";
	public static final String SUPERVISOR_VALUE = "Supervisor";
	public static final String TECHNICIAN_VALUE = "Technician";
	
	public static final String LOCAL_PATH = "/Maintenance/upload/";

	public static Map<Long, String> statusMap = new LinkedHashMap<Long, String>();
	public static Map<Long, String> typeMap = new LinkedHashMap<Long, String>();
	public static Map<Long, String> verifiedMap = new LinkedHashMap<Long, String>();
	public static Map<Long, String> approvedMap = new LinkedHashMap<Long, String>();
	public static Map<Long, String> rankMap = new LinkedHashMap<Long, String>();
	public static Map<Long, String> createByMap = new LinkedHashMap<Long, String>();
	public static Map<Long, String> roleMap = new LinkedHashMap<Long, String>();
	

	static {
		statusMap.put(NOT_STARTED_KEY, NOT_STARTED_VALUE);
		statusMap.put(IN_PROGRESS_KEY, IN_PROGRESS_VALUE);
		statusMap.put(COMPLETED_KEY, COMPLETED_VALUE);
		statusMap.put(DEFERRED_KEY, DEFERRED_VALUE);
		statusMap.put(WAITING_ON_SOMEONE_ELSE_KEY, WAITING_ON_SOMEONE_ELSE_VALUE);

		typeMap.put(TYPE1_KEY, TYPE1_VALUE);
		typeMap.put(TYPE2_KEY, TYPE2_VALUE);
		
		verifiedMap.put(APPROVED_KEY, APPROVED_VALUE);
		verifiedMap.put(REJECT_KEY, REJECT_VALUE);
		
		approvedMap.put(APPROVED_KEY, APPROVED_VALUE);
		approvedMap.put(REJECT_KEY, REJECT_VALUE);
		
		rankMap.put(TYPE1_KEY, TYPE1_VALUE);
		rankMap.put(TYPE2_KEY, TYPE2_VALUE);
		
		createByMap.put(TYPE1_KEY, TYPE1_VALUE);
		createByMap.put(TYPE2_KEY, TYPE2_VALUE);
		
		roleMap.put(ADMIN_KEY, ADMIN_VALUE);
		roleMap.put(BOSS_KEY, BOSS_VALUE);
		roleMap.put(SUPERVISOR_KEY, SUPERVISOR_VALUE);
		roleMap.put(TECHNICIAN_KEY, TECHNICIAN_VALUE);
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
