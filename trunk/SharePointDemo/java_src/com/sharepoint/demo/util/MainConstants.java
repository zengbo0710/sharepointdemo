package com.sharepoint.demo.util;

import java.util.LinkedHashMap;
import java.util.Map;

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
	
	
	public static Map<Integer,String> statusMap = new LinkedHashMap<Integer,String>();
	public static Map<Integer,String> typeMap = new LinkedHashMap<Integer,String>();
	
	static{
		statusMap.put(NOT_STARTED_KEY, NOT_STARTED_VALUE);
		statusMap.put(IN_PROGRESS_KEY, IN_PROGRESS_VALUE);
		statusMap.put(COMPLETED_KEY, COMPLETED_VALUE);
		statusMap.put(DEFERRED_KEY, DEFERRED_VALUE);
		statusMap.put(WAITING_ON_SOMEONE_ELSE_KEY, WAITING_ON_SOMEONE_ELSE_VALUE);
		
		typeMap.put(TYPE1_KEY,TYPE1_VALUE);
		typeMap.put(TYPE2_KEY,TYPE2_VALUE);
	}
}
