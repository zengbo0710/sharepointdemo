/**
 * 2008-7-14
 */
package org.cmcc.axis.wsdl;

import java.util.Map;

/**
 * 
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public abstract class ModelUtils {
	/**
	 * Get Integer, Default value (0)
	 * 
	 * @param model
	 * @param key
	 * @return
	 */
	public static int getIntParameter(Map<String, Object> model, String key) {
		return getIntParameter(model, key, 0);

	}

	/**
	 * Get Integer, customize value.
	 * 
	 * @param model
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static int getIntParameter(Map<String, Object> model, String key,
			int defaultValue) {
		Integer value = (Integer) model.get(key);
		value = (value == null) ? defaultValue : value;
		return value;
	}

	/**
	 * Get Long, efault value (0)
	 * 
	 * @param model
	 * @param key
	 * @return
	 */
	public static long getLongParameter(Map<String, Object> model, String key) {
		return getLongParameter(model, key, 0);

	}

	/**
	 * Get Long, customize value.
	 * 
	 * @param model
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static long getLongParameter(Map<String, Object> model, String key,
			int defaultValue) {
		Long value = (Long) model.get(key);
		value = (value == null) ? defaultValue : value;
		return value;
	}

	/**
	 * Get Boolean, default value (false)
	 * 
	 * @param model
	 * @param key
	 * @return
	 */
	public static boolean getBooleanParameter(Map<String, Object> model,
			String key) {
		return getBooleanParameter(model, key, false);

	}

	/**
	 * Get Boolean, customize value.
	 * 
	 * @param model
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static boolean getBooleanParameter(Map<String, Object> model,
			String key, boolean defaultValue) {
		Boolean value = (Boolean) model.get(key);
		value = (value == null) ? defaultValue : value;
		return value;
	}

	/**
	 * Get String, default value ("")
	 * 
	 * @param model
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static String getStringParameter(Map<String, Object> model,
			String key) {
		return getStringParameter(model, key, "");
	}

	/**
	 * Get String, customize value.
	 * 
	 * @param model
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static String getStringParameter(Map<String, Object> model,
			String key, String defaultValue) {
		String value = (String) model.get(key);
		value = (value == null) ? defaultValue : value;
		return value;
	}

}
