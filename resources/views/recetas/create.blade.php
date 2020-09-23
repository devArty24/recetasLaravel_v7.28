@extends("layouts.app")

@section('styles')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/trix/1.2.4/trix.css" crossorigin="anonymous" />
@endsection

@section('botones')
    <a href="{{route('recetas.index')}}" class="btn btn-outline-primary mr-2 text-uppercase font-weight-bold">
        <svg class="w-6 h-6 icono" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 15l-3-3m0 0l3-3m-3 3h8M3 12a9 9 0 1118 0 9 9 0 01-18 0z"></path></svg>
        Volver
    </a>
@endsection

@section('content')
    <h2 class="text-center bm-5">Crear nueva receta</h2>

    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
        <form action="{{route("recetas.store")}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="titulo">Titulo receta</label>
                    <input type="text" name="titulo" class="form-control @error('titulo') is-invalid @enderror" 
                        id="titulo" placeholder="Titulo receta" value="{{old("titulo")}}">
                    @error('titulo')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="categoria">Categoria</label>
                    <select name="categoria" id="categoria" class="form-control" @error('categoria') is-invalid @enderror>
                            <option value="">>> Seleccione <<</option>
                        @foreach ($categorias as $categoria)
                            <option value="{{$categoria->id}}" {{(old("categoria")==$categoria->id)?"selected":""}}>{{$categoria->nombre}}</option>
                        @endforeach
                    </select>
                    @error('categoria')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group mt-3">
                    <label for="preparacion">Preparacion</label>
                    <input type="hidden" id="preparacion" name="preparacion" class="form-control" value="{{old("preparacion")}}">
                    <trix-editor class="form-control @error('preparacion') is-invalid @enderror" input="preparacion"></trix-editor>
                    @error('preparacion')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group mt-3">
                    <label for="ingredientes">Ingredientes</label>
                    <input type="hidden" id="ingredientes" name="ingredientes" class="form-control" value="{{old("ingredientes")}}">
                    <trix-editor class="form-control @error('preparacion') is-invalid @enderror" input="ingredientes"></trix-editor>
                    @error('ingredientes')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="imagen">Selecciona una imagen</label>
                    <input type="file" class="form-control @error('preparacion') is-invalid @enderror" id="imagen" name="imagen">
                    @error('imagen')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{$message}}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Agregar receta">
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/trix/1.2.4/trix.js" crossorigin="anonymous" defer></script>
@endsection