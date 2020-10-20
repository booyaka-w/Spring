package com.knife4j.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.github.xiaoymin.knife4j.annotations.DynamicParameter;
import com.github.xiaoymin.knife4j.annotations.DynamicParameters;
import com.github.xiaoymin.knife4j.annotations.DynamicResponseParameters;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;

@Api(tags = "云站通-首页")
@ApiSupport(order = 1)
@RequestMapping("sysongy/cloud/api/home")
@RestController
public class IndexController {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@ApiOperation(value = "首页页面接口", notes = "查询首页页面信息")
	@PostMapping("/index")
	@ApiOperationSupport(params = @DynamicParameters(name = "CreateOrderModel", properties = {
			@DynamicParameter(name = "id", value = "注解id", example = "X000111", required = true, dataTypeClass = Integer.class),
			@DynamicParameter(name = "name", value = "订单编号", required = false) }), responses = @DynamicResponseParameters(properties = {
					@DynamicParameter(value = "编号", name = "id"), @DynamicParameter(value = "名称", name = "name"),
					@DynamicParameter(value = "订单", name = "orderDate") }))
	public String pageIndex(@RequestBody JSONObject jsonObject) throws Exception {
		System.err.println(jsonObject);
		return jsonObject.toString();
	}

}
