/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2012
 */

package com.sharepoint.demo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;

import com.sharepoint.demo.model.TbMaintenance;
import com.sharepoint.demo.service.TbMaintenanceManager;
import com.sharepoint.demo.util.MainConstants;
import com.sharepoint.demo.vo.query.TbMaintenanceQuery;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/tbmaintenance")
public class TbMaintenanceController extends BaseRestSpringController<TbMaintenance, java.lang.Integer> {
	// 默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null;

	private TbMaintenanceManager tbMaintenanceManager;

	private final String LIST_ACTION = "redirect:/tbmaintenance";

	/**
	 * 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写
	 **/
	public void setTbMaintenanceManager(TbMaintenanceManager manager) {
		this.tbMaintenanceManager = manager;
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
		model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
		model.addAttribute("status", MainConstants.statusMap);
		model.addAttribute("type", MainConstants.typeMap);
	}

	/** 列表 */
	@RequestMapping
	public String index(ModelMap model, TbMaintenanceQuery query, HttpServletRequest request, HttpServletResponse response) {
		Page page = this.tbMaintenanceManager.findPage(query);

		model.addAllAttributes(toModelMap(page, query));
		return "/tbmaintenance/index";
	}

	/** 显示 */
	@RequestMapping(value = "/{id}")
	public String show(ModelMap model, @PathVariable java.lang.Integer id) throws Exception {
		TbMaintenance tbMaintenance = (TbMaintenance) tbMaintenanceManager.getById(id);
		model.addAttribute("tbMaintenance", tbMaintenance);
		return "/tbmaintenance/show";
	}

	/** 进入新增 */
	@RequestMapping(value = "/new")
	public String _new(ModelMap model, TbMaintenance tbMaintenance, HttpServletRequest request, HttpServletResponse response) throws Exception {
		model.addAttribute("tbMaintenance", tbMaintenance);
		return "/tbmaintenance/new";
	}

	/** 保存新增,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult */
	@RequestMapping(method = RequestMethod.POST)
	public String create(@RequestParam(value = "file", required = false) MultipartFile uploadFile, ModelMap model, @Valid TbMaintenance tbMaintenance, BindingResult errors, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (errors.hasErrors()) {
			return "/tbmaintenance/new";
		}
		String uploadFilePath = "";
		String fileName = "";
		try {
			fileName = uploadFile.getOriginalFilename();  
			InputStream is = uploadFile.getInputStream();
			uploadFilePath = MainConstants.getUploadPath(request.getLocalPort());
			//如果服务器已经存在和上传文件同名的文件，则输出提示信息
			File tempFile = new File(uploadFilePath + fileName);
			if (tempFile.exists()) {
				boolean delResult = tempFile.delete();
				System.out.println("删除已存在的文件：" + delResult);
			}
			//开始保存文件到服务器
			if (!fileName.equals("")) {
				FileOutputStream fos = new FileOutputStream(uploadFilePath + fileName);
				byte[] buffer = new byte[8192]; // 每次读8K字节
				int count = 0;
				//开始读取上传文件的字节，并将其输出到服务端的上传文件输出流中
				while ((count = is.read(buffer)) > 0) {
					fos.write(buffer, 0, count); // 向服务端文件写入字节流
				}
				fos.close(); //关闭FileOutputStream对象
				is.close(); //InputStream对象
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		tbMaintenance.setLink(uploadFilePath + fileName);
		tbMaintenanceManager.save(tbMaintenance);
		Flash.current().success(CREATED_SUCCESS); // 存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}

	/** 编辑 */
	@RequestMapping(value = "/{id}/edit")
	public String edit(ModelMap model, @PathVariable java.lang.Integer id) throws Exception {
		TbMaintenance tbMaintenance = (TbMaintenance) tbMaintenanceManager.getById(id);
		model.addAttribute("tbMaintenance", tbMaintenance);
		return "/tbmaintenance/edit";
	}

	/** 保存更新,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult */
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public String update(ModelMap model, @PathVariable java.lang.Integer id, @Valid TbMaintenance tbMaintenance, BindingResult errors, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (errors.hasErrors()) {
			return "/tbmaintenance/edit";
		}

		tbMaintenanceManager.update(tbMaintenance);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}

	/** 删除 */
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(ModelMap model, @PathVariable java.lang.Integer id) {
		tbMaintenanceManager.removeById(id);
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	/** 批量删除 */
	@RequestMapping(method = RequestMethod.DELETE)
	public String batchDelete(ModelMap model, @RequestParam("items") java.lang.Integer[] items) {
		for (int i = 0; i < items.length; i++) {
			tbMaintenanceManager.removeById(items[i]);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

}
