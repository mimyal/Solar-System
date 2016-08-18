class Planet
  # getters/setters avoid array/hash for now
  attr_accessor :name, :class, :diameter_in_m, :rate_of_solar_rotation, :distance_from_sun, :inhabitants, :population
  def initialize(planet_data)
    @name = planet_data[:name]
    @class = planet_data[:class]
    @diameter_in_m = planet_data[:diameter_in_m]
    @rate_of_solar_rotation = planet_data[:rate_of_solar_rotation]
    @distance_from_sun = planet_data[:distance_from_sun]
    @inhabitants = planet_data[:inhabitants]
    @population = planet_data[:population]
  end #initialize

# This class is only data handling!

end #class
