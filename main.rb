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
    if user_input.nil? or user_input.empty?
      @ingreds << user_input.split
      @ingreds.map! do |input_ingreds|
        @tags_and_recipes.map! do |tags_recipes|
          tags_recipes.reject! { |x| x.nil? }
          if tags_recipes[0].include?(input_ingreds[0][0])
            @recipes.push(tags_recipes[1])
          end
        end
        return @recipes
      end
    end
  end

  def add_recipe(recipe, tags, name)
    @recipes[tags] = "#{name} " + " #{recipe}"
  end
end

