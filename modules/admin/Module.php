<?php

namespace app\modules\admin;


use app\models\Users;
use Yii;


class Module extends \yii\base\Module
{
    public $controllerNamespace = 'app\modules\admin\controllers';
    public $defaultRoute = 'news';
    public $layout = 'main';

    public function init()
    {
        parent::init();


        if(Yii::$app->user->isGuest  )
        {
            return Yii::$app->getResponse()->redirect('site/index');
        }
        $user=Users::find(Yii::$app->user->id)->one();
       // print_r($user->id);
        if($user->role==2)
        {

            return Yii::$app->getResponse()->redirect('site/index');
        }







    }

    
}
