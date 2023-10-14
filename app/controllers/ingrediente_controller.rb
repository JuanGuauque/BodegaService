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
    if params[:id].to_i != 0
      @ingrediente = Ingrediente.find(params[:id])
    else
      @ingrediente = Ingrediente.find_by(nombre: params[:id])
    end
    
    if @ingrediente.update(ingrediente_params)
      render json: @ingrediente
    else
      render json: @ingrediente.errors, status: :unprocessable_entity
    end
  end

  def disponibilidad_ingredientes
    ingredientes_cant = {}
    params[:ingredientes].split(/\s*,\s*/).each do |ingrediente_name|
      ingrediente = Ingrediente.find_by(nombre: ingrediente_name.capitalize)
      ingredientes_cant[ingrediente.nombre] = {
        cantidad: ingrediente.cantidad
      }
    end

    render json: ingredientes_cant
  end

  private

  def ingrediente_params
    params.require(:ingrediente).permit(:nombre, :cantidad)
  end
end
