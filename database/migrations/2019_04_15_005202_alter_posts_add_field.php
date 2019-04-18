<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPostsAddField extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->string('slug')->after("title")->unique()->commit("将文章标题转化为 URL 的一部分，以利于SEO");
            $table->softDeletes();
            $table->timestamp('published_at')->nullable()->after("created_at")->commit("文章正式发布时间");

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->dropColumn('deleted_at');
            $table->dropColumn('published_at');
            $table->dropColumn('slug');            
        });
    }
}
