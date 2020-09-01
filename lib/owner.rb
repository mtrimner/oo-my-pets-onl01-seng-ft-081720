require 'pry'
class Owner
  
attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{@species}."
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
      Cat.all.select {|cat| cat.owner == self}
    
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
    
  end

  def buy_cat(name)
   cat = Cat.new(name, self)
   
  end

  def buy_dog(name)
  dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each {|dog| dog.mood = "nervous"}
    cats.each {|cat| cat.mood = "nervous"}
    dogs.each {|dog| dog.owner = nil}
    cats.each {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
