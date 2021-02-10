<?php

namespace app\models;

use app\models\forms\Registration;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use Yii;
class Users extends ActiveRecord implements IdentityInterface
{

    const DISABLED = 0;
    const ACTIVE = 1;

    const ROLE_ADMIN=1;
    const ROLE_USER=2;

    public static function tableName() {
        return 'user';
    }

    public function rules()
    {
        return [
            [['id',
                'username',
                'is_active',
                'role',
                'password'
                ], 'required']

        ];
    }

    public function attributeLabels() {
        return [
            'user_id' => 'ID автора',
            'username' => 'Имя пользователя',
            'group' => 'Имя пользователя',
//            'content' => 'Текст новости',
//            'news_status' => 'Статус новости',
        ];
    }

    public static function findIdentity($user_id)
    {
        return static::findOne($user_id);
    }

    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username]);
    }

    public function registration(Registration $registration)
    {
        $this->username = $registration->login;
        $this->password = Yii::$app->security->generatePasswordHash($registration->pass);
       // $this->role=self::ROLE_USER;
        //$this->first_name='';
        //$this->last_name='';
        //$this->is_active=self::ACTIVE;
        //$this->created_date=time();
        //$this->email='';

    }

    public function validatePassword($password)
    {
        return password_verify($password, $this->password);
    }

    public function getId()
    {
        return $this->user_id;
    }

    public function getRole()
    {
        return $this->role;
    }


    public static function getUserIdIfAuthorized()
    {
        if (\Yii::$app->user &&
                \Yii::$app->user->identity &&
                \Yii::$app->user->identity->getId() > 0) {
            return \Yii::$app->user->id;
        } else {
            return false;
        }
    }

    /**
     * Finds an identity by the given token.
     *
     * @param string $token the token to be looked for
     * @return IdentityInterface|null the identity object that matches the given token.
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
//        return static::findOne(['access_token' => $token]);
    }

    /**
     * Cookie auth key
     * @return mixed
     */
    public function getAuthKey()
    {
//        return $this->auth_key;
    }

    public function validateAuthKey($authKey)
    {
//        return $this->auth_key === $authKey;
    }

}