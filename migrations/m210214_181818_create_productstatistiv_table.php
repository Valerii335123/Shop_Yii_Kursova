<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%productstatistiv}}`.
 */
class m210214_181818_create_productstatistiv_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%productstatistiv}}', [
            'id' => $this->primaryKey(),
            'product_id'=>$this->integer(),
            'amount'=>$this->integer()
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%productstatistiv}}');
    }
}
