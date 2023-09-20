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
        Schema::create('score_type', function (Blueprint $table) {
            $table->bigIncrements('score_type_id');
            $table->string('name');
            $table->date('date');
            $table->integer('type'); // 1-ប្រចាំខែ 2-ប្រចាំឆមាស 3-ប្រចាំឆ្នាំ
            $table->softDeletes();
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
        Schema::dropIfExists('score_type');
    }
};
