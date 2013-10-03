/**
 * 2008-7-10
 */
package org.cmcc.axis.wsdl;

import java.util.Map;

/**
 * description: Model<br>
 *  
 * @author ZengBo
 * @version 1.0
 * @since 1.0
 */
public interface Model<T> {
	/**
	 * @param model
	 * @return
	 */
	T toObject(Map<String, Object> model);

	/**
	 * @param t
	 * @return
	 */
	Map<String, Object> toModel(T t);
}
