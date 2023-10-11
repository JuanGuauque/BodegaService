class CreateIngredientes < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredientes do |t|
      t.string :nombre
      t.integer :cantidad

      t.timestamps
    end
  end
end
