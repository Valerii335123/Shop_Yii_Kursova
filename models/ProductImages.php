<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_images".
 *
 * @property int $image_id
 * @property int $product_id
 * @property string $product_image_url
 * @property string $title
 */
class ProductImages extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_images';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'product_image_url', 'photoName'], 'required'],
            [['product_id'], 'integer'],
            [['product_image_url'], 'image'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'image_id' => 'Image ID',
            'product_id' => 'Product ID',
            'product_image_url' => 'Product Image Url',
            'photoName' => 'Title',
        ];
    }
}
