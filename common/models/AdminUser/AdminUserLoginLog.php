<?php
namespace common\models\AdminUser;

use common\utils\ClientUtil;
use yii\db\ActiveRecord;

/**
 * Class AdminUserLoginLog 登录日志表
 * @package app\models\AdminUser
 * @property int $id 主键
 * @property int $uid 用户UID
 * @property string $ip 登录IP
 * @property string $data 登录参数
 * @property string $url 登录url地址
 * @property string $client_name 浏览器名称
 * @property string $client_version 浏览器名称
 * @property string $platform 客户端系统名称
 * @property string $created 登录时间
 * @author Gene <https://github.com/Talkyunyun>
 */
class AdminUserLoginLog extends ActiveRecord {

    public static function tableName() {
        return 'sys_admin_user_login_log';
    }

    /**
     * 记录登录日志
     * @return bool
     */
    public static function add() {
        $model = new self();

        $data = [
            'post' => \Yii::$app->request->post(),
            'get'  => \Yii::$app->request->get()
        ];

        $client = ClientUtil::getClientInfo();
        $model->url            = \Yii::$app->request->getAbsoluteUrl();
        $model->uid            = \Yii::$app->user->identity->id;
        $model->ip             = \Yii::$app->request->userIP;
        $model->data           = json_encode($data);
        $model->client_name    = $client['name'];
        $model->client_version = $client['version'];
        $model->platform       = $client['platform'];

        return $model->save();
    }
}