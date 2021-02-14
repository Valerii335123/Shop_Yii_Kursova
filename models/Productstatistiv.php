<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "productstatistiv".
 *
 * @property int $id
 * @property int|null $product_id
 * @property int|null $amount
 * @property string $time
 */
class Productstatistiv extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'productstatistiv';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'amount'], 'integer'],
            [['time','id'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'product_id' => 'Product ID',
            'amount' => 'Количество додаваний в корзину',
            'time' => 'Time',
        ];
    }
}
