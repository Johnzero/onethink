<?php

namespace Admin\Model;
use Think\Model;

/**
 * 用户模型
 * @author guth
 */

class AskModel extends Model {

    public function getTree($id = 0, $field = true,$maps = array()){
        $list = $this->where($maps)->field($field)->order('id')->select();
        return $list;
    }
    

}
