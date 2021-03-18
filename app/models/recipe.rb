class Recipe < ActiveRecord::Base
  has_many :ingredients 

  # accepts_nested_attributes_for :ingredients#, reject_if: proc { |i| i[:name].blank? }

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each {|ingredient_attributes|
      if ingredient_attributes[:name].present?
        ingredient = Ingredient.find_or_create_by(ingredient_attributes)
        binding.pry
        self.ingredients << ingredient
      end
    }
  end
end
