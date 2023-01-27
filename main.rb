class Recipes
  def initialize
    @recipes = {"яйцо, хлеб, молоко, фарш" => "Котлета, пожарить, съесть.",
      "яйцо, картошка, олия" => "Драник, пожарить, съесть." }
    @ingreds = []
    @arr = []
    @arr2 = []
    $recipes2 = {}
  end

  def find_recipe(user_input)
    @ingreds << user_input
    @recipes.each do |each_hash|
      @ingreds.each do |each_ingreds|
        if each_hash[0].include?(each_ingreds)
          each_hash[1]
        end
      end
    end
  end

  def add_recipe(recipe, tags, name)
    @recipes[tags] = "#{name} " + " #{recipe}"
  end
end
