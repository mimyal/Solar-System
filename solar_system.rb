require_relative 'planet'

# This class will be able to list  the current known planets
# Limitation: There is no 'universe', ie current collection of planets
class Solarsystem
  attr_accessor :solarsystem # getters/setters

  def initialize
    @solarsystem = []
  end #initialize

  # Adds a new planet to solarsystem with the hash parameter planet_data
  # Returns the extended solarsystem array
  def add_planet(planet)
    @solarsystem << planet
    return @solarsystem # @note is this line needed?
  end #add_planet

  # Extends to @solarsystem using single add method add_planet
  def add_list_of_planets(planet_database)
    planet_database.each do |planet_data|
      planet = Planet.new(planet_data)
      add_planet(planet) # add_planet changes the instance variable @solarsystem above
    end #do
  end #def

  # Returns a display the information of the planets
  def show_all_planets
    puts
    @solarsystem.each do |planet|
      puts
      puts "#{ planet.name.upcase}"
      puts "#{ planet.name } is a #{ planet.class } class planet, #{ planet.diameter_in_m/1000 } km in diameter."
      puts "It is at a fair distance from its sun and circles it in #{ planet.rate_of_solar_rotation } days."
      puts "#{ planet.name } is inhabited by #{ planet.population/1000 } million #{ planet.inhabitants } inhabitants."
      puts "(The stored planet data as of 2016/08/15)"
    end #each
  end #show_all_planets

  # Method using the key :name (attr_accessor) pull out the two elements of the array
  # and pull out the key (distance_from_sun) - for the two queried planets in program
  # and compare the values
  def calculate_relative_distance # @solarsystem is an array (of planet hashes)
    solarsystem = @solarsystem
    first_planet_name = ""
    second_planet_name = ""
    system_planet_names = []
    first_planet = Planet.new({})
    second_planet = Planet.new({})
    puts
    puts "This program will calculate the relative distance of two planets in the solar system."
    print "The planets are: "

    solarsystem.each do |planet|
      print "#{ planet.name } "
      system_planet_names << planet.name.downcase
    end #do

    puts
    begin
      print "Please enter the first planet you are interested in: "
      first_planet_name = gets.chomp.downcase
    end until system_planet_names.include?(first_planet_name)
    puts
    begin
      print "Please enter the second planet you are interested in: "
      second_planet_name = gets.chomp.downcase
    end until system_planet_names.include?(second_planet_name)

    solarsystem.each do |planet|
      if planet.name == first_planet_name.capitalize
        first_planet = planet
      elsif planet.name == second_planet_name.capitalize
        second_planet = planet
      end #if
    end #do
    first_distance = (first_planet.distance_from_sun) / 1000 / 1000 # in thousand km
    second_distance = (second_planet.distance_from_sun) / 1000 / 1000
    relative_distance = (first_distance - second_distance).abs # will always give a positive/absolute number
    puts
    puts "The relative distance between #{ first_planet_name.capitalize } and #{ second_planet_name.capitalize } is #{ relative_distance } thousand km."
    # @TODO too many decimal places
  end

end # Solarsystem
