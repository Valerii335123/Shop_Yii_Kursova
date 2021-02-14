<?php

namespace app\models\repository;


use app\models\Productstatistiv;
use app\models\Users;

class Statistic
{

        public function save(Productstatistiv $model)
        {
            var_dump($model);
            if(!$model->save())
            {
                throw new Exaption('Eror save');
            }
        }
}

