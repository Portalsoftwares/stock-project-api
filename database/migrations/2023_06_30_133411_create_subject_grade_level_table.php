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
        Schema::create('subject_grade_level', function (Blueprint $table) {
            $table->bigIncrements('subject_grade_id');
            $table->integer('subject_id');
            $table->integer('grade_level_id');
            $table->integer('class_type_id');
            $table->decimal('full_score');
            $table->decimal('divide');
            $table->decimal('average');
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
        Schema::dropIfExists('subject_grade_level');
    }
};
