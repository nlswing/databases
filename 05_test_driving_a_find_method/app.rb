require_relative 'lib/database_connection'
require_relative 'lib/recipie_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, average_cook_time_mins, rating FROM recipies;'
result = DatabaseConnection.exec_params(sql, [])


recipie_repository = RecipieRepository.new
recipie_repository.all.each do |recipie|
  puts "#{recipie.id} - #{recipie.name} - #{recipie.average_cook_time_mins} - #{recipie.rating}"
end