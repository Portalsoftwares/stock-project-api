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
        Schema::create('score_type_academic', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('academic_id');
            $table->string('under_score_type_id'); //Mutiple Id under semester
            $table->string('semester_id'); // ឆមាស១  ឬ ឆមាស២
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
        Schema::dropIfExists('score_type_academic');
    }
};
