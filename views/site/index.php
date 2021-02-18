<?php

?>

<div class="site-index">

    <div class="body-content">

        <div class="row">

            <div class="col-lg-8">

                <?php
                    echo \yii\widgets\ListView::widget([
                        'dataProvider' => $dataProvider,
                        'itemView' => '_post',
                        'summary' => '',
                    ]);
                ?>
            </div>
        </div>



    </div>
</div>
