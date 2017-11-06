<?php
namespace api\modules\v1\controllers;


use yii\web\Controller;

class TestController extends Controller {


    public function actionIndex() {


        dd(\Yii::$app->getComponents());
        echo "aaaaa";

//         return $this->render('index');
    }


    public function actionTest() {

        echo "sdfdsf";
    }
}