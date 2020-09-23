<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categoria_recetas',function(Blueprint $table){
            $table->id();
            $table->string("nombre");
            $table->timestamps();
        });

        Schema::create('recetas', function (Blueprint $table) {
            $table->id();
            $table->string("titulo");
            $table->text("ingredientes");
            $table->text("preparacion");
            $table->string("imagen");
            $table->foreignId("user_id")->references("id")->on("users")->comment("Este campo es uan foreignKey de la tabla de usuarios, asi es como se genera una llave foranea");
            $table->foreignId("categoria_id")->references("id")->on("categoria_recetas")->comment("Campo que es una foreignKey de la tabla de categorias, asi es como se genera una llave foranea");
            $table->timestamps();
            /* SE PUEDE COMENTAR CADA CAMPO PARA QUE SEA MAS ENTENDIBLE, SE HACE CON: ->comment("Campo y su descripcion"); */
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('categoria_recetas');
        Schema::dropIfExists('recetas');
    }
}
