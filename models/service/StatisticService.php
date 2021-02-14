<?php

namespace app\models\service;


use app\models\Productstatistiv;
use app\models\repository\Statistic;
use app\models\User;
use yii\base\Model;

class StatisticService
{
    private $repo;

    public function __construct(Statistic $repo)
    {
        $this->repo = $repo;
    }


    public function addPocket($id)
    {
        $model=Productstatistiv::find(['product_id' => $id])->one();
        if($model)
        {
            $model->amount=$model->amount+1;
        }
        else
        {
            $model=new Productstatistiv();
            $model->amount=1;
            $model->product_id=$id;
        }

        $this->repo->save($model);
    }
}

