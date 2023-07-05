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
        Schema::create('student_class', function (Blueprint $table) {
            $table->id();
            $table->integer('student_id');
            $table->integer('class_id');
            $table->integer('from_class_id');
            $table->boolean('is_duplicate');
            $table->string('from_secondary_high_school');
            $table->dateTime('secondary_exam_date');
            $table->string('secondary_exam_place');
            $table->integer('secondary_exam_room');
            $table->integer('secondary_exam_desk');
            $table->integer('role_id');
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
        Schema::dropIfExists('student_class');
    }
};
