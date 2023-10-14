class Ingrediente < ApplicationRecord
  validates_numericality_of :cantidad, greater_than: 0
end
