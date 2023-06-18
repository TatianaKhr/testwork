<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->ulid('id');
            $table->boolean('type');
            $table->decimal('sum', 3, 2);
            $table->unsignedInteger('user_id');
            $table->timestamp('date_of_transaction', $precision = 0);
            $table->softDeletes();

            $table->index('user_id', 'user_transaction_user_idx');
            $table->foreign('user_id', 'user_transaction_user_fk')->on('users')->references('id');

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
        Schema::dropIfExists('transactions');
    }
};
