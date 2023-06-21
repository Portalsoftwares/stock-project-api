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
        Schema::create('subject_day_schedule', function (Blueprint $table) {
            $table->id();
            $table->integer('subject_id');
            $table->integer('time_id');
            $table->integer('day_id');
            $table->integer('schedule_class_id');
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
        Schema::dropIfExists('subject_day_schedule');
    }
};
