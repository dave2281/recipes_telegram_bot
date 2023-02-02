class Recipes
  def initialize
    @recipes = {"яйцо, хлеб, молоко, фарш" => "Котлета, пожарить, съесть.",
      "яйцо, картошка, олия" => "Драник, пожарить, съесть." }
    @ingreds = []
    @arr = []
    # @arr2 = []
    # $recipes2 = {}
  end

  def find_recipe(user_input)
    @ingreds << user_input
    @recipes.map do |each_hash|
      @ingreds.map do |each_ingreds|
        if each_hash[0].include?(each_ingreds)
          @arr << each_hash[1]
        end
      end
    end
    return @arr.join("\n")
  end

  def add_recipe(recipe, tags, name)
    @recipes[tags] = "#{name} " + " #{recipe}"
  end
end
