class Dessert
  attr_accessor :name, :calories

  def healthy?
    calories < 200
  end

  def delicious?
    true
  end 
    
  def initialize(name, calories)
    @name, @calories = name, calories
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  def delicious?
    @flavor == 'black licorice' ? false : true
  end
end
