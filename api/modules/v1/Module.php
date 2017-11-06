<?php
namespace api\modules\v1;

/**
 * 版本模块入口文件
 * @author Gene <https://github.com/Talkyunyun>
 */
class Module extends \yii\base\Module {

    // 指定模板布局文件
    public $layout = 'main';

    // 初始化
    public function init() {
        parent::init();

        // 加载对应模块配置文件
        $config = require_once __DIR__ . '/config/config.php';
        $components = \Yii::$app->getComponents();

        $routes = require_once __DIR__ . '/config/routes.php';
        $components['urlManager']['rules'] = array_merge($routes, $components['urlManager']['rules']);
        $config['components'] = array_merge($components, $config['components']);
        $config['params'] = array_merge($config['params'], \Yii::$app->params);

        \Yii::configure(\Yii::$app, $config);
    }
}