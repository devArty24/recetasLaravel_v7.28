<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Receta extends Model
{
    /* IMPRTANTE, CAMPOS QUE SE AGREGARAN DESDE UN FORMULARIO */
    protected $fillable = [
        'titulo', 'ingredientes', 'preparacion','imagen','categoria_id'
    ];

    /* OBTIENE LA COTEGORIA DE LA RECETA VIA FK */
    public function categoria(){
        return $this->belongsTo(CategoriaReceta::class);
    }

    /* OBTIENE LA INFORMACION DEL USUARIO VIA fk, EN OCASIONES SE LE DEBE INDICAR EN UQE CAMPO SE ESTA GUARDANDO LA RELACION DE LA fk */
    public function autor(){
        return $this->belongsTo(User::class,"user_id");
    }

    /* LIKES QUE HA RECIBIDO UNA RECETA */
    public function likes(){
        return $this->belongsToMany("App\User","likes_receta");
    }
}
