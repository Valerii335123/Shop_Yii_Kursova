<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ProductImages */

$this->title = Yii::t('app', 'Update Product Images: {name}', [
    'name' => $model->title,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Product Images'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->image_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="product-images-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
