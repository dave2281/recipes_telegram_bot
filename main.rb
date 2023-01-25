class Recipes
  def initialize
    @recipes = {"яйцо, хлеб, молоко, фарш" => "Котлета, пожарить, съесть.",
      "картошка, яйцо, олия" => "Драник, пожарить, съесть." }
    @ingreds = []
    @arr = []
    @arr2 = []
    $recipes2 = {}
  end

  def find_recipe(user_input)
    @arr << user_input
    p @arr
    @arr.map do |input|
      @ingreds << input
      p @ingreds
    end
    @recipes.map do |recipes_and_keys|
      @ingreds.map do |ingred|
        if recipes_and_keys[0].include?(ingred)
          unless user_input.nil? || user_input.empty?
            @arr2 << recipes_and_keys[1]
            p @arr2
            $recipes2[user_input] = @arr2
            p $recipes2
          else
            break
          end
        end
      end
    end
    return ($recipes2[user_input]).join('
      ')
  end

  def add_recipe(recipe, tags, name)
    @recipes[tags] = "#{name} " + " #{recipe}"
  end
end

class_recipes = Recipes.new
input = gets.chomp.to_s
b = class_recipes.find_recipe(input)
p b

