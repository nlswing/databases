require_relative './recipie'

class RecipieRepository
  def all
    sql = 'SELECT id, name, average_cook_time_mins, rating FROM recipies;'
    result_set = DatabaseConnection.exec_params(sql, [])

    recipies = []

    result_set.each do |record|
      recipie = Recipie.new
      recipie.id = record['id']
      recipie.name = record['name']
      recipie.average_cook_time_mins = record['average_cook_time_mins']
      recipie.rating = record['rating']

      recipies << recipie
    end

    return recipies
  end

  def find(id)
    sql = 'SELECT id, name, average_cook_time_mins FROM recipies WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    recipie = Recipie.new
    recipie.id = record['id']
    recipie.name = record['name']
    recipie.average_cook_time_mins = record['average_cook_time_mins']
    recipie.rating['rating']

    return recipie
  end
end