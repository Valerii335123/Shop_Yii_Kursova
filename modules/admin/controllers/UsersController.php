<?php

namespace app\modules\admin\controllers;

use Yii;
use app\components\Controller;
use app\models\Users;

class UsersController extends Controller
{

    public function actionIndex()
    {
        $users = Users::find()->all();
        return $this->render('index', ['users' => $users]);
    }

    public  function actionUpdate($id)
    {
        $users = Users::find(['user_id'=>$id])->one();
        $users->is_active= !$users->is_active;
        return $this->redirect('/admin/users/index');
    }


}