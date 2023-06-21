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
        Schema::create('schedule_class', function (Blueprint $table) {
            $table->bigIncrements('schedule_class_id');
            $table->integer('grade_level_id');
            $table->integer('time_id');
            $table->integer('day1_subject_id');
            $table->integer('day2_subject_id');
            $table->integer('day3_subject_id');
            $table->integer('day4_subject_id');
            $table->integer('day5_subject_id');
            $table->integer('day6_subject_id');
            $table->integer('day7_subject_id');
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
        Schema::dropIfExists('schedule_class');
    }
};
