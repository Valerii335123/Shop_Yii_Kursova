<?php

namespace app\models;

use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

class Users extends ActiveRecord implements IdentityInterface
{

    const DISABLED = 0;
    const ACTIVE = 1;

    const ROLE_ADMIN=1;
    const ROLE_USER=2;

    public static function tableName() {
        return 'users';
    }

    public function rules()
    {
        return [
            [['user_id',
                'username',
                'is_active',
                'role'], 'required']

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