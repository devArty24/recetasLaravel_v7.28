<template>
    <input type="submit" class="btn btn-danger d-block w-100 mb-2" value="Eliminar" @click="eliminarReceta">
    <!-- v-on:click= funciona tambien -->
</template>
<script>
    export default {
        props:["recetaId"],
        methods: {
            eliminarReceta(){
                this.$swal({
                    title: 'Deseas eliminar la receta?',
                    text: "Una vez eliminada no se puede recuperar",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si!',
                    cancelButtonText: 'No'
                    }).then((result) => {
                        if(result.isConfirmed){
                            const params = {
                                id:this.recetaId
                            }

                            /* ENVIAR PETECION AL SERVIDOR CON AXIOS */
                            axios.post(`/recetas/${this.recetaId}`,{params,_method:'delete'})
                                .then(response =>{
                                    this.$swal({
                                        title: 'Receta eliminada',
                                        text: 'Se elimino la receta',
                                        icon: 'success'
                                    });
                                    /* ELIMIAR DEL DOM */
                                    this.$el.parentNode.parentNode.parentNode.removeChild(this.$el.parentNode.parentNode);
                                }).catch(error =>{
                                    console.log(error);
                                });
                        }
                    })
            }
        }
    }
</script>