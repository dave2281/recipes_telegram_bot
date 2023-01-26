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
    @arr.map do |input|
      @ingreds << input
    end
    @recipes.map do |recipes_and_keys|
      @ingreds.map do |ingred|
        if recipes_and_keys[0].include?(ingred)
          unless user_input.nil? || user_input.empty?
            @arr2 << recipes_and_keys[1]
            $recipes2[user_input] = @arr2
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

