<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProductImages */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-images-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'product_id')->textInput([ 'disabled' => 'disabled']) ?>

    <?= $form->field($model, 'product_image_url')->fileInput() ?>

    <?= $form->field($model, 'photoName')->textInput(['maxlength' => true,'placeholder' => 'Введіть назву фото',]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
