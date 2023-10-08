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
        Schema::create('teacher', function (Blueprint $table) {
            $table->bigIncrements('teacher_id');
            $table->string('tid')->nullable();
            $table->string('first_name_kh');
            $table->string('last_name_kh');
            $table->string('full_name_kh');
            $table->string('first_name_en');
            $table->string('last_name_en');
            $table->string('full_name_en');
            $table->date('date_of_birth');
            $table->integer('gender_id');
            $table->string('teacher_level')->nullable();
            $table->string('profession')->nullable();
            $table->string('role')->nullable();
            $table->date('join_date')->nullable();
            $table->string('place_of_birth')->nullable();
            $table->string('address')->nullable();
            $table->integer('status_id')->nullable();
            $table->integer('file_upload_id')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->boolean('is_enable_account')->default(0);
            $table->string('other')->nullable();
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
        Schema::dropIfExists('teacher');
    }
};
