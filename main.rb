class Recipes
  def initialize
    @recipes = {"яйцо, хлеб, молоко, фарш" => "Котлета, пожарить, съесть.",
      "картошка, яйцо, олия" => "Драник, пожарить, съесть." }
    @ingreds = []
    @arr = []
    @arr2 = []
    $recipes2 = {}
  end

  def find_recipe
    @ingreds.map do |input_ingreds|
      unless input_ingreds.nil? or input_ingreds.empty?
        @tags_and_recipes.map do |tags_recipes|
          if tags_recipes[0].include?(input_ingreds[0][0])
            @recipes.push(tags_recipes[1])
          end
        end
        return @recipes
      else
        break
      end
    end
  end

  def add_recipe(recipe, tags, name)
    @recipes[tags] = "#{name} " + " #{recipe}"
  end
end

