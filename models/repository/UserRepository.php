<?php

namespace app\models\repository;


use app\models\Users;

class UserRepository
{
    public function save(Users $user)
    {

        if (!$user->save()) {
            throw new \RuntimeException('Saving error.');
        }
    }

    public function findByUserName($login)
    {
        return Users::findOne(['username' => $login]);
    }

    public function getById($id)
    {
        $user = Users::findOne($id);
        if ($user == null) {
            throw new \DomainException('User is not found');
        }
        return $user;
    }
}

