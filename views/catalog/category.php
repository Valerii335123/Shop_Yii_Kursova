<?php

use yii\helpers\Html;
use yii\widgets\LinkPager;
use yii\widgets\ActiveForm;
use yii\bootstrap\Modal;

$this->params['breadcrumbs'][] = ['label' => 'Каталог товаров', 'url' => ['/catalog']];
foreach ($fullPath as $path) {
    $this->params['breadcrumbs'][] = ['label' => $path->name, 'url' => ["/catalog/category/$path->category_id"]];
}

$this->registerJs("
    function addproduct(productid) {
        $.ajax({
            type: 'POST',
            url: '/products/addproduct/',
            data: {id: productid},
             success: function(data) {
                if (JSON.parse(data) !== 'nok') {
                    $('#cartcounter').text('Корзина ('+JSON.parse(data)+')');
                }
            }
        });
    }", \yii\web\View::POS_END);
?>
Фильтр товаров по брендам:<br>
<div class="filter">
    <div>
        <?php
        $form = ActiveForm::begin([
            'id' => 'active-form',
            'options' => [
                'class' => 'form-horizontal',
                'enctype' => 'multipart/form-data',
                'name' => 'brandsfilter',
            ],
            'fieldConfig' => [
                'template' => "{input}\n{label}\n{hint}\n{error}",
            ]
        ]);
        ?>

        <?php foreach ($brands as $attr => $item): ?>

            <?= $form->field($filtermodel, $attr)->checkbox(['label' => $item, 'name' => $attr]) ?>

        <?php endforeach; ?>

        <div class="form-group">
            <?php // Html::submitButton('Отправить', ['class' => 'btn btn-primary', 'name' => 'filter_submit']) ?>
            <?= Html::submitInput('Фильтровать', ['class' => 'btn btn-primary', 'name' => 'filter_submit']) ?>
        </div>

        <?php ActiveForm::end(); ?>
    </div>
</div>

<div class="content">
    <div class="categories" style="overflow: hidden">
        <div>подкатегории категории "<?= $path->name ?>":</div>
        <?php foreach ($subcategories as $category): ?>
            <div class="category">
                <div align="center">
                    <?=
                    Html::a('',
                        ['/catalog/category/', 'id' => $category['category_id']]
                    )
                    ?>
                </div>
                подкатегория
                - <?= Html::a($category['name'], ['/catalog/category/', 'id' => $category['category_id']]) ?>
                <br> количество товаров ( <?= $category['quantity_visible'] ?> )
                ( <?= $category['quantity_invisible'] ?> )
            </div>
        <?php endforeach; ?>
    </div>
    <div class="products">
        <div>товары категории "<?= $path->name ?>":</div>

        <?php foreach ($products as $product): ?>
            <div class="product">

                <?php
                if (isset($product["product_image_url"])) {
                    $url = $product["product_image_url"];
                    $image = "/$url";
                } else $image = "http://dummyimage.com/150x100/fafafa/3ea1ec";
                ?>


                <?= Html::img($image, ['alt' => 'pic not found', 'style' => 'width:150px;height: 100px']) ?>
                <div>Название товара:
                    <b> <?= Html::a($product['title'], ['/products', 'id' => $product['product_id']], ['target' => '_blank',]) ?> </b>
                </div>
                <div>Бренд:
                    <?= Html::encode($product['brand_name']) ?>
                </div>
                <div>Описание:s
                    <?= Html::encode($product['description']) ?>
                </div>
                <div>
                    цена: <?= Html::encode($product['price']) ?> (специальная
                    цена: <?= Html::encode($product['special_price']) ?>)
                </div>
                <div>
                    <input type="button" value="Добавить в корзину" id="addproduct"
                           onclick="addproduct(<?= $product['product_id'] ?>)">
                    <?php
                    Modal::begin([
                        'header' => '<h3>Связаться с менеджером</h3>',
                        'toggleButton' => [
                            'label' => 'Купить сейчас',
                            //'href' => Url::toRoute('/site/index'),
                            //'href' => Url::toRoute(['/products/index', 'id' => $product['product_id']]),
                        ],
                        //'view' => ['index', 'id' => $product['product_id']]
                    ]);
                    echo $this->context->renderPartial('/site/_contact');
                    echo \Yii::$app->view->renderFile('@app/views/site/_contact.php');
                    Modal::end();
                    ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="clear"></div>

    <?= LinkPager::widget(['pagination' => $pagination]) ?>
</div>