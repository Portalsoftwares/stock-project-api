<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases_lines', function (Blueprint $table) {
            $table->id();
            $table->integer('txn_ref_id');
            $table->string('txn_type');
            $table->string('description');
            $table->integer('product_ref_id');
            $table->integer('qty');
            $table->decimal('unit_price');
            $table->decimal('amount');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchases_lines');
    }
};
