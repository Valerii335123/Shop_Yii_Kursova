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


//        if(Yii::$app->user->isGuest  )
//        {
//            return Yii::$app->getResponse()->redirect('site/index');
//        }
//        $user=Users::findOne(Yii::$app->user->id);
//        //print_r($user->getId());
//        if($user->role==Users::ROLE_USER)
//        {
//            return Yii::$app->getResponse()->redirect('site/index');
//        }

        if (!Yii::$app->user->isGuest) {
            $user = Users::findOne(['user_id' => Yii::$app->user->getId()]);
            if ($user->role == Users::ROLE_USER)
                return Yii::$app->response->redirect(['site/']);
        } else
            return Yii::$app->response->redirect(['site/']);






    }

    
}
