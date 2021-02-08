<?php

use yii\data\ActiveDataProvider;
use app\models\Attributes;
use kartik\grid\GridView;
use yii\bootstrap\Html;

$this->params['breadcrumbs'][] = ['label' => 'Администрирование', 'url' => ['/admin']];
$this->params['breadcrumbs'][] = ['label' => 'Атрибуты товаров', 'url' => ['index']];
?>

<div class="admin-default-index">
<?php
$dataProvider = new ActiveDataProvider([
    'query' => Attributes::find(),
    'pagination' => [
        'pageSize' => 10,
    ],
]);

echo GridView::widget([
    'dataProvider' => $dataProvider,
    'toolbar' => [
        [
            'content' =>
                Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'], ['class' => 'btn btn-success']) . ' ' .
                Html::a('<i class="glyphicon glyphicon-repeat"></i>', ['index'], [
                    'data-pjax' => 10,
                    'class' => 'btn btn-default',
                    'title' => 'Reset Grid'
                ])
        ],
        '{toggleData}',

    ],
    'panel' => [
        'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-globe"></i> Атрибуты товаров</h3>',
        'type' => 'success',
        'before' => Html::a('<i class="glyphicon glyphicon-plus"></i> Добавить атрибут', ['create'], ['class' => 'btn btn-success']),
        'after' => Html::a('<i class="glyphicon glyphicon-repeat"></i> Сбросить', ['index'], ['class' => 'btn btn-info']) . ' ' .
            Html::button('<i class="glyphicon glyphicon-trash"></i> Удалить выбранные', ['class' => 'btn btn-warning', 'id' => 'multi_delete', 'onclick' => 'multi_delete()']),
    ],
    'columns' => [
        [
            'class' => 'yii\grid\CheckboxColumn',
        ],
        'attribute_id',
        'attribute_name',
        'unit',
        [
            'class' => 'yii\grid\ActionColumn',
            'template' => '{view} {edit} {delete}',
            'buttons' => ['edit' => function ($url, $model, $key) {
                return Html::a('Edit', $url);
            }],
        ],
    ],
    'resizableColumns' => false,
    'containerOptions' => ['id' => 'news-pjax-container', 'style' => 'overflow: auto'],
    'headerRowOptions' => ['class' => 'kartik-sheet-style'],
    'filterRowOptions' => ['class' => 'kartik-sheet-style'],
    'pjax' => true,
]);
?>
</div>