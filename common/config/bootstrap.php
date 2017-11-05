<?php
/**
 * APP启动最先执行程序
 * @author Gene <https://github.com/Talkyunyun>
 */

// 加载常量配置文件
require_once __DIR__ . '/constants.php';

// 设置运行环境，控制所有模块
defined('YII_ENV') or define('YII_ENV', ENV_LOCAL);

// 只有正式环境debug关闭，其他默认打开
defined('YII_DEBUG') or define('YII_DEBUG', YII_ENV == ENV_PRD ? false : true);

function dd($data = []) {
    var_dump($data);die;
}


function appAlias() {
    Yii::setAlias('@common', dirname(__DIR__));
    Yii::setAlias('@backend', ROOT_PATH . '/backend');
    Yii::setAlias('@api', ROOT_PATH . '/api');
    Yii::setAlias('@console', ROOT_PATH . '/console');
}