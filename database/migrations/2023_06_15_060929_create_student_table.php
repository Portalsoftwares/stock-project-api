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
        Schema::create('student', function (Blueprint $table) {
            $table->bigIncrements('student_id');
            $table->string('sid');
            $table->string('first_name_kh');
            $table->string('last_name_kh');
            $table->string('full_name_kh');
            $table->string('first_name_en');
            $table->string('last_name_en');
            $table->string('full_name_en');
            $table->date('date_of_birth');
            $table->integer('file_upload_id')->nullable();
            $table->integer('gender_id');
            $table->integer('status_id');
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('address');
            $table->string('place_of_birth')->nullable();
            $table->string('from_secondary_high_school')->nullable();
            $table->dateTime('secondary_exam_date')->nullable();
            $table->string('secondary_exam_place')->nullable();
            $table->integer('secondary_exam_room')->nullable();
            $table->integer('secondary_exam_desk')->nullable();
            $table->string('other')->nullable();
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
        Schema::dropIfExists('student');
    }
};
