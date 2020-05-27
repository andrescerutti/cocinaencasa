class KitIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :kit
end
