<?php

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            "name"=>"Arturo",
            "email"=>"correo@correo.com",
            "password"=>Hash::make("12345678"),
            "url"=>"https://www.easyGame.com",
        ]);        

        $user2 = User::create([
            "name"=>"Armin",
            "email"=>"correo2@correo.com",
            "password"=>Hash::make("12345678"),
            "url"=>"https://www.snk.com",
        ]);

    }
}
