<?php

namespace App\Http\Controllers;

use App\Receta;
use App\CategoriaReceta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

class RecetaController extends Controller
{
    public function __construct(){
        $this->middleware("auth",["except"=>["show","search"]]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /* Auth::user()->recetas->dd(); */
        /* OBTENER LAS RECETAS ESTA FORMA NO FUNCIONA PARA PAGINAR */
            //$recetas = auth()->user()->recetas;
        $usuario = auth()->user();
        /* OBTNER RECETAS PARA QUE SE PUEDAN PAGINAR */
        $recetas = Receta::where("user_id",$usuario->id)->paginate(2);

        return view("recetas.index")->with("recetas",$recetas)->with("usuario",$usuario);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        /* DB::table("categoria_receta")->get()->pluck("nombre","id")->dd(); */

        /* OBTENER CATEGORIA SIN UTILIZAR MODELO */
            /* $categorias = DB::table("categoria_receta")->get()->pluck("nombre","id"); */

        /* CON MODELO */
        $categorias = CategoriaReceta::all(["id","nombre"]);
        return view("recetas.create")->with("categorias",$categorias);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /* Validar campos */
        $data = $request->validate([
            "titulo"=>"required|min:6",
            "categoria"=>"required",
            "preparacion"=>"required",
            "ingredientes"=>"required",
            "imagen"=>"required|image"
        ]);
        
        /* Obtener nombre y ruta de la imagen */
        $rutaImagen = $request["imagen"]->store("upload-Recetas","public");
        /* Resize de la imagen */
        $img = Image::make(public_path("storage/{$rutaImagen}"))->fit(1000,550);
        $img->save();
        
        /* ALMACENAR EN LA BASE SIN UTILIZAR MODELO*/
            /* DB::table("recetas")->insert([
                "titulo"=>$data["titulo"],
                "ingredientes"=>$data["ingredientes"],
                "preparacion"=>$data["preparacion"],
                "imagen"=>$rutaImagen,
                "user_id"=>Auth::user()->id,
                "categoria_id"=>$data["categoria"]
            ]); */

        /* ALMACENAR CON MODELO */
        auth()->user()->recetas()->create([
            "titulo"=>$data["titulo"],
            "ingredientes"=>$data["ingredientes"],
            "preparacion"=>$data["preparacion"],
            "imagen"=>$rutaImagen,
            "categoria_id"=>$data["categoria"]
        ]);
        /*Redireccionar */
        return redirect()->action("RecetaController@index");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function show(Receta $receta)
    {
        /* OBTENER EL LIKE DE UNA RECETAS SI EL USUARIO ESTA AUTENTICADO */
        $like = (auth()->user())?auth()->user()->meGusta->contains($receta->id):false;

        /* PASA LA CANTITAD DE LIKES A LA VISTA */
        $likes = $receta->likes->count();

        return view("recetas.show")->with("receta",$receta)->with("like",$like)->with("likes",$likes);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function edit(Receta $receta)
    {
        /* EJECUTAR EL POLICY PARA QUE SOLO EL USAUARIO LOGUEA PUEDA VER SU INFORMACION */
        $this->authorize("view",$receta);

        $categorias = CategoriaReceta::all(["id","nombre"]);
        return view("recetas.edit")->with("categorias",$categorias)->with("receta",$receta);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Receta $receta)
    {
        /* Ejecutar el policy */
        $this->authorize("update",$receta);

        /* Validar campos */
        $data = $request->validate([
            "titulo"=>"required|min:6",
            "categoria"=>"required",
            "preparacion"=>"required",
            "ingredientes"=>"required"
        ]);

        $receta->titulo = $data["titulo"];
        $receta->categoria_id = $data["categoria"];
        $receta->preparacion = $data["preparacion"];
        $receta->ingredientes = $data["ingredientes"];
        /* SI EL USUARIOS SUBE UNA IMAGEN */
        if(request("imagen")){
            /* Obtener nombre y ruta de la imagen */
            $rutaImagen = $request["imagen"]->store("upload-Recetas","public");
            /* Resize de la imagen */
            $img = Image::make(public_path("storage/{$rutaImagen}"))->fit(1000,550);
            $img->save();

            /* SE ASIGNA AL OBJETO DEL FORM */
            $receta->imagen = $rutaImagen;
        }
        $receta->save();

        /* REDIRECCIONAR AL INDEX */
        return redirect()->action("RecetaController@index");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Receta $receta)
    {
        /* EJECTUAR EL Policy */
        $this->authorize("delete",$receta);

        $receta->delete();

        return redirect()->action("RecetaController@index");
    }

    public function search(Request $request){
        $busqueda = $request["buscar"];
        $recetas = Receta::where("titulo","like","%".$busqueda."%")->paginate(1);
        $recetas->appends(["buscar"=>$busqueda]);

        return view("busquedas.show",compact("recetas","busqueda"));
    }
}
