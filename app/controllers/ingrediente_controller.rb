class IngredienteController < ApplicationController
  def index
    @ingredientes = Ingrediente.all
    # Crear un hash donde la clave es el nombre del ingrediente y el valor es el detalle del ingrediente
    ingredientes_hash = {}
    @ingredientes.each do |ingrediente|
      ingredientes_hash[ingrediente.nombre] = {
        id: ingrediente.id,
        nombre: ingrediente.nombre,
        cantidad: ingrediente.cantidad
      }
    end 
    # Convertir el hash a JSON
    ingredientes_json = JSON.generate(ingredientes_hash)

    # Renderizar el JSON
    render json: ingredientes_json
  end
  
  def update
    @ingrediente = Ingrediente.find(params[:id])
    if @ingrediente.update(ingrediente_params)
      render json: @ingrediente
    else
      render json: @ingrediente.errors, status: :unprocessable_entity
    end
  end

  private

  def ingrediente_params
    params.require(:ingrediente).permit(:nombre, :cantidad)
  end
end
