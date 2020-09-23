<?php

namespace App\Http\Controllers;

use App\Perfil;
use App\Receta;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class PerfilController extends Controller
{
    public function __construct(){
        $this->middleware("auth",["except"=>"show"]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Perfil  $perfil
     * @return \Illuminate\Http\Response
     */
    public function show(Perfil $perfil)
    {
        $recetas = Receta::where("user_id",$perfil->user_id)->paginate(10);
        return view("perfiles.show")->with("perfil",$perfil)->with("recetas",$recetas);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Perfil  $perfil
     * @return \Illuminate\Http\Response
     */
    public function edit(Perfil $perfil)
    {
        /* EJECUTAR EL POLICY PARA QUE SOLO EL USAUARIO LOGUEA PUEDA VER SU INFORMACION */
        $this->authorize("view",$perfil);

        return view("perfiles.edit")->with("perfil",$perfil);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Perfil  $perfil
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Perfil $perfil)
    {
        /* EJECUTAR EL POLICY */
        $this->authorize("update",$perfil);
        
        /* VALIDACION DE LOS CAMPOS */
        $data = request()->validate([
            "nombre"=> "required",
            "url"=> "required",
            "biografia"=>"required"
        ]);

        /* SI EL USUARIOS SUBE UNA IMAGEN */
        if(request("imagen")){
            /* Obtener nombre y ruta de la imagen */
            $rutaImagen = $request["imagen"]->store("upload-perfiles","public");
            /* Resize de la imagen */
            $img = Image::make(public_path("storage/{$rutaImagen}"))->fit(500,550);
            $img->save();
            
            $arrayImagen = ["imagen"=>$rutaImagen];
        }

        /* ASIGNAR NOMBRE Y URL */
        auth()->user()->url = $data["url"];
        auth()->user()->name = $data["nombre"];
        auth()->user()->save();

        /* AHORA ELIMIAR URL Y NOMBRE DE LA VARIABLE $data PARA QUE SE PUEDA ASIGNAR EN LA OTRA TABLA */
        unset($data["url"]);
        unset($data["nombre"]);

        /* ASIGNAR BIOGRAFIA E IMAGEN A LA SEGUNDA TABLA */
        auth()->user()->perfil()->update(array_merge(
            $data,$arrayImagen ?? []
        ));

        return redirect()->action("RecetaController@index");
    }   

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Perfil  $perfil
     * @return \Illuminate\Http\Response
     */
    public function destroy(Perfil $perfil)
    {
        //
    }
}
