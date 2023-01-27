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
    @recipes.each do |each_hash|
      if each_hash[0].include?(user_input)
        return each_hash[1]
      end
    end
  end

  def add_recipe(recipe, tags, name)
    @recipes[tags] = "#{name} " + " #{recipe}"
  end
end
