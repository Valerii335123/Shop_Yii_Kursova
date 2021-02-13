<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ProductImages;

/**
 * ProductImagesSearch represents the model behind the search form of `app\models\ProductImages`.
 */
class ProductImagesSearch extends ProductImages
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['image_id', 'product_id'], 'integer'],
            [['product_image_url', 'title'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ProductImages::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'image_id' => $this->image_id,
            'product_id' => $this->product_id,
        ]);

        $query->andFilterWhere(['like', 'product_image_url', $this->product_image_url])
            ->andFilterWhere(['like', 'title', $this->title]);

        return $dataProvider;
    }
}
