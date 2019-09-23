class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters
    # Making use of the meals method we already have which is an array of this customer instance's meals
    meals.map do |meal|
      meal.waiter
    end
  end

  def self.all
    @@all
  end 
end