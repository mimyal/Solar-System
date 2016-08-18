# Finished optional calculate_relative_distance
require_relative 'solar_system'
require_relative 'planet'

# Method to request information for a new planet
# "factory" method, leave outside class Planet
def new_planet
  planet_data = {}
  print "What is the name of the planet you want to add? (Earth is a great answer!) "
  planet_data[:name] = gets.chomp
  puts
  print "What is the planet class of #{ planet_data[:name] }? (M is a good answer!) "
  planet_data[:class] = gets.chomp
  puts
  print "What is the planet diameter in meters? (12742000 meters is a good answer!)"
  planet_data[:diameter_in_m] = gets.chomp.to_i
  puts
  print "What is the rate of solar rotation in Earth days? (365.25 days, maybe?) "
  planet_data[:rate_of_solar_rotation] = gets.chomp.to_f
  puts
  print "What is the distance to the solar system sun in meters? (149600000 meters, what do you think?)"
  planet_data[:distance_from_sun] = gets.chomp.to_i
  puts
  print "What species is the inhabitants of #{ planet_data[:name] }? "
  planet_data[:inhabitants] =gets.chomp
  puts
  print "What is the population of #{ planet_data[:name] }, in million? (7100000 million)"
  planet_data[:population] = gets.chomp.to_i
  puts
  return Planet.new(planet_data)
end #new_planet

# Here's our known data
list_of_planets = [
  {
    name: "Tatooine",
    class: "M",
    diameter_in_m: 12742010,
    rate_of_solar_rotation: 621, #days
    distance_from_sun: 496000010,
    inhabitants: "sand people",
    population: 570000
  },
  {
    name: "Alderaan",
    class: "M",
    diameter_in_m: 12742001,
    rate_of_solar_rotation: 350, #days
    distance_from_sun: 309600001,
    inhabitants: "elf",
    population: 58100000
  },
  {
    name: "Hoth",
    class: "M",
    diameter_in_m: 8742002,
    rate_of_solar_rotation: 193, #days
    distance_from_sun: 259600002,
    inhabitants: "klingon",
    population: 220000
  },
  {
    name: "Yavin",
    class: "M",
    diameter_in_m: 3742003,
    rate_of_solar_rotation: 149, #days
    distance_from_sun: 99600003,
    inhabitants: "human",
    population: 50000
  }]

#solarsystem_name = "Sol"
my_solarsystem = Solarsystem.new
my_solarsystem.add_list_of_planets(list_of_planets) # adds to @solarsystem
my_solarsystem.show_all_planets
user_planet = new_planet  #returns planet
my_solarsystem.add_planet(user_planet) #
my_solarsystem.show_all_planets
my_solarsystem.calculate_relative_distance
