/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */


package com.maintenance.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javacommon.base.BaseRestSpringController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;

import com.maintenance.demo.model.TbIncomingTasks;
import com.maintenance.demo.model.TbUserInfo;
import com.maintenance.demo.service.TbIncomingTasksManager;
import com.maintenance.demo.util.MainConstants;
import com.maintenance.demo.vo.query.TbIncomingTasksQuery;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/tbincomingtasks")
public class TbIncomingTasksController extends BaseRestSpringController<TbIncomingTasks,java.lang.Integer>{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	private TbIncomingTasksManager tbIncomingTasksManager;
	
	private final String LIST_ACTION = "redirect:/tbincomingtasks";
	
	/** 
	 * 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写
	 **/
	public void setTbIncomingTasksManager(TbIncomingTasksManager manager) {
		this.tbIncomingTasksManager = manager;
	}
	
	/** binder用于bean属性的设置 */
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));  
	}
	   
	/**
	 * 增加了@ModelAttribute的方法可以在本controller方法调用前执行,可以存放一些共享变量,如枚举值,或是一些初始化操作
	 */
	@ModelAttribute
	public void init(ModelMap model) {
		model.addAttribute("role1Map",MainConstants.roleMap);
		model.addAttribute("statusMap",MainConstants.statusMap);
		model.addAttribute("typeMap",MainConstants.typeMap);
		model.addAttribute("verifiedMap",MainConstants.verifiedMap);
		model.addAttribute("approvedMap",MainConstants.approvedMap);
		model.addAttribute("rankMap",MainConstants.rankMap);
		model.addAttribute("createByMap",MainConstants.createByMap);
		List<Object> userlist = tbIncomingTasksManager.findAll(TbUserInfo.class);
		Map<Integer, String> userMap = new LinkedHashMap<Integer, String>();
		for (int i = 0; i < userlist.size(); i++) {
			TbUserInfo userInfo = (TbUserInfo)userlist.get(i);
			userMap.put(userInfo.getId(), userInfo.getUserName());
		}
		model.addAttribute("userMap",userMap);
		model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
	}
	
	/** 列表 */
	@RequestMapping
	public String index(ModelMap model,TbIncomingTasksQuery query,HttpServletRequest request,HttpServletResponse response) {
		TbUserInfo userInfo = (TbUserInfo)request.getSession().getAttribute("userInfo");
		if(userInfo.getRole()>2){
			query.setSignTo(userInfo.getId());
		}
		Page page = this.tbIncomingTasksManager.findPage(query);
		model.addAllAttributes(toModelMap(page, query));
		return "/tbincomingtasks/index";
	}
	
	/** 显示 */
	@RequestMapping(value="/{id}")
	public String show(ModelMap model,@PathVariable java.lang.Integer id) throws Exception {
		TbIncomingTasks tbIncomingTasks = (TbIncomingTasks)tbIncomingTasksManager.getById(id);
		model.addAttribute("tbIncomingTasks",tbIncomingTasks);
		return "/tbincomingtasks/show";
	}

	/** 进入新增 */
	@RequestMapping(value="/new")
	public String _new(ModelMap model,TbIncomingTasks tbIncomingTasks,HttpServletRequest request,HttpServletResponse response) throws Exception {
		model.addAttribute("tbIncomingTasks",tbIncomingTasks);
		return "/tbincomingtasks/new";
	}
	
	/** 保存新增,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(method=RequestMethod.POST)
	public String create(ModelMap model,@Valid TbIncomingTasks tbIncomingTasks,BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return  "/tbincomingtasks/new";
		}
		
		tbIncomingTasksManager.save(tbIncomingTasks);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/** 编辑 */
	@RequestMapping(value="/{id}/edit")
	public String edit(ModelMap model,@PathVariable java.lang.Integer id) throws Exception {
		TbIncomingTasks tbIncomingTasks = (TbIncomingTasks)tbIncomingTasksManager.getById(id);
		model.addAttribute("tbIncomingTasks",tbIncomingTasks);
		return "/tbincomingtasks/edit";
	}
	
	/** 保存更新,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String update(ModelMap model,@PathVariable java.lang.Integer id,@Valid TbIncomingTasks tbIncomingTasks,BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return "/tbincomingtasks/edit";
		}
		
		tbIncomingTasksManager.update(tbIncomingTasks);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 删除 */
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	public String delete(ModelMap model,@PathVariable java.lang.Integer id) {
		tbIncomingTasksManager.removeById(id);
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	/** 批量删除 */
	@RequestMapping(method=RequestMethod.DELETE)
	public String batchDelete(ModelMap model,@RequestParam("items") java.lang.Integer[] items) {
		for(int i = 0; i < items.length; i++) {
			tbIncomingTasksManager.removeById(items[i]);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
}

