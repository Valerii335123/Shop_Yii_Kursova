<?php

use app\models\Orders;
use kartik\grid\GridView;
use yii\bootstrap\Html;



?>

<div class="admin-default-index">
<?php
echo GridView::widget([
    'dataProvider' => $dataProvider,
    'toolbar' => [
        [
            'content' =>
                Html::a('<i class="glyphicon glyphicon-plus"></i>', ['add'], ['class' => 'btn btn-success']) . ' ' .
                Html::a('<i class="glyphicon glyphicon-repeat"></i>', ['index'], ['data-pjax' => 10, 'class' => 'btn btn-default', 'title' => 'Reset Grid'])
        ],
        '{toggleData}',

    ],
    'columns' => [
        [
            'class' => 'yii\grid\CheckboxColumn',
        ],
        'order_id',
        'user.username',
        'entered_name',
        [
            'class' => 'kartik\grid\ExpandRowColumn',
            'width' => '50px',
            'value' => function ($model, $key, $index, $column) {
                return GridView::ROW_COLLAPSED;
            },
            'detailUrl' => 'order-detail',
            'headerOptions' => ['class' => 'kartik-sheet-style'],
            'expandOneOnly' => true
        ],
        'user_phone_number',
        ['attribute' => 'total_sum', 'label' => 'Зафиксированная<br>сумма', 'encodeLabel' => false],
        'time_ordered',

        [
            'filter' => Orders::getOrderStatuses(),
            'attribute' => 'status',
            'label' => 'Статус заказа',
            'format' => 'raw',
            'value' => function ($model, $key, $index, $column) {
                return Html::tag('span', Html::encode(Orders::getOrderStatus($model['status'])),
                    ['class' => 'label status-' . Orders::getOrderStatus($model['status'], true)]);
            }
        ],
    ],
    'options' => ['id' => 'grid'],
    'resizableColumns' => false,
    'containerOptions' => ['id' => 'news-pjax-container', 'style' => 'overflow: auto'],
    'headerRowOptions' => ['class' => 'kartik-sheet-style'],
    'filterRowOptions' => ['class' => 'kartik-sheet-style'],
    'pjax' => true,
]);
?>
</div>

<div>
    <b>Зафиксированная сумма</b> - сумма заказа, которая внесена в базу данных:
    <br>
    изначально равна сумме на момент отправки заказа покупателем,
    <br>
    может быть заменена менеджером на актуальную сумму кнопкой "Зафиксировать сумму"
</div>