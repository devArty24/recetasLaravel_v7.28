<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Perfil extends Model
{
    /* RELACION INVERSA 1:1 DE PERFIL Y USUARIO */
    public function usuario(){
        return $this->belongsTo(User::class,"user_id");
    }
}
