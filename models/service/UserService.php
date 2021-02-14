<?php

namespace app\models\service;

use app\models\Users;
use Yii;
use app\models\forms\LoginForm;
use app\models\repository\UserRepository;
use app\models\forms\Registration;
use app\models\User;

class UserService
{
    private $userRepository;

    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function registration(Registration $registration)
    {
        $user = new Users();
        $user->registration($registration);
        //  var_dump($user);
        $this->userRepository->save($user);
        // $user->save();
    }

    public function login(LoginForm $loginForm)
    {
        $user = $this->userRepository->findByUserName($loginForm->username);

        if (!$user || !$user->validatePassword($loginForm->password)) {
            throw new \Exception('Undefined login or pass');

        } elseif (!$user->is_active) {
            throw new \Exception('User is banned');

        } else {

             Yii::$app->user->login($user, $loginForm->rememberMe ? 3600 * 24 : 1800);
          //  print_r(Yii::$app->user->id);
             return true;
        }
    }

    public function changeRole($id)
    {
        $user = $this->userRepository->getById($id);
        $user->role = $user->role ? User::ROLE_USER : User::ROLE_ADMIN;
        $this->userRepository->save($user);
    }

    public function changeActive($id)
    {
        $user = $this->userRepository->getById($id);
        $user->active = $user->active ? User::USER_INACTIVE : User::USER_ACTIVE;
        $this->userRepository->save($user);
    }
}

