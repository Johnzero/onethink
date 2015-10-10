<?php
// +----------------------------------------------------------------------
// guth askmodel
// 20150922
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;

/**
 * 分类模型
 */
class AskModel extends Model{
	/**
	 * 提交问题
	 * @author guth 
	 */
	public function save_ask($field = false){
		return $this->add($field);
	}

	/**
	 * 问题验证
	 * @author guth 
	 */
	public function check_ask($data)
	{
		$return_array = array();
		$return_array['error'] = false;
		
		$ask_info = array();
		$ask_info['name'] = addslashes($data['name']);
		$ask_info['title'] = addslashes($data['title']);
		$ask_info['tel'] = addslashes($data['tel']);
		$ask_info['sfz'] = addslashes($data['sfz']);
		$ask_info['email'] = addslashes($data['email']);
		$ask_info['content'] = addslashes($data['content']);
		
		if(empty($ask_info['name']))
		{
			$return_array['error'] = '名称不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['title']))
		{
			$return_array['error'] = '标题不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['tel']))
		{
			$return_array['error'] = '电话不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['sfz']))
		{
			$return_array['error'] = '身份证不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['content']))
		{
			$return_array['error'] = '内容不能为空';
			return $return_array;
		}
		
		
		$return_array['data'] = $ask_info;
		return $return_array;
	}
}