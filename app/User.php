<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','url',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /* CREACIOND EUN EVENTO PARA CREAR UN PERFIL EN CUANTO SE REGISTRE UN NUEVO USUARIO */
    protected static function boot(){
        parent::boot();
        /* ASGNAR PERFIL UNA VEZ QUE SE HAYA CREADO UN USUARIO NUEVO */
        static::created(function($user){
            $user->perfil()->create();
        });
    }

    /* RELACION DE UNO A MUCHOS(1:n) DE USUARIO A RECETAS  */
    public function recetas(){
        return $this->hasMany(Receta::class);
    }

    /* RELACION 1:1 DE USUARIO Y PERFIL */
    public function perfil(){
        return $this->hasOne(Perfil::class);
    }

    /* RECETAS QUE CADA USUARIO A DADO LIKE */
    public function meGusta(){
        return $this->belongsToMany("App\Receta","likes_receta");
    }
}
