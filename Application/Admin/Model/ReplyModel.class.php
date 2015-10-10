<?php

namespace Admin\Model;
use Think\Model;

/**
 * 用户模型
 * @author guth
 */

class ReplyModel extends Model {

	/**
	 * 问题验证
	 */
	public function check_reply($data)
	{
		$return_array = array();
		$return_array['error'] = false;
		
		$ask_info = array();
		$ask_info['explain'] = addslashes($data['explain']);
		$ask_info['reply_content'] = addslashes($data['reply_content']);
		$ask_info['remarks'] = addslashes($data['remarks']);
		$ask_info['transactor'] = addslashes($data['transactor']);
		$ask_info['transactor_tel'] = addslashes($data['transactor_tel']);
		
		if(empty($ask_info['explain']))
		{
			$return_array['error'] = '办理情况不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['reply_content']))
		{
			$return_array['error'] = '答复口径不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['transactor']))
		{
			$return_array['error'] = '经办人不能为空';
			return $return_array;
		}
		
		if(empty($ask_info['transactor_tel']))
		{
			$return_array['error'] = '联系电话不能为空';
			return $return_array;
		}
		
		
		$return_array['data'] = $ask_info;
		return $return_array;
	}
	
	/**
	 * 提交答复
	 */
	public function save_ask($field = false){
		$parents = M("Reply")->where(array("aid"=>$field['aid']))->find();
		
		if(!empty($parents))
		{
			//$where = array();
			//$where['aid'] = $field['aid'];
			//return $this->where($where)->save($field);
		}
		else
		{
			M("Ask")->where(array("id"=>$field['aid']))->save(array("status"=>4,"update_time"=>time()));
			$process = array();
			$process["uid"] = UID;
			$process["aid"] = $field['aid'];
			$process["status"] = 4;
			$process["create_time"] = time();
			$process["create_uid"] = UID;
			$process["info"] = $field['reply_content'];
			M("Process")->add($process);
			
			return $this->add($field);
		}
	}
}
