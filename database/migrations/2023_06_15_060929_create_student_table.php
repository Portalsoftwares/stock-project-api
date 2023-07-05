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
            $table->string('first_name_kh');
            $table->string('last_name_kh');
            $table->string('first_name_en');
            $table->string('last_name_en');
            $table->date('date_of_birth');
            $table->integer('file_upload_id');
            $table->integer('gender_id');
            $table->integer('status_id');
            $table->string('phone');
            $table->string('email');
            $table->string('address');
            $table->string('place_of_birth');
            $table->string('other');
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
