# Recipies Directory Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table
```


Table: Recipies

Columns:
id | name | average_cook_time_mins | rating
```

## 2. Create Test SQL seeds

```sql

TRUNCATE TABLE recipies RESTART IDENTITY; 

INSERT INTO recipies (name, average_cook_time_mins, rating) VALUES ('Lasagne', '100', '4');
INSERT INTO recipies (name, average_cook_time_mins, rating) VALUES ('Pizza', '25', '4');
```


```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

```ruby
# Table name: recipies

# Model class
# (in lib/recipie.rb)
class Recipie
end

# Repository class
# (in lib/recipie_repository.rb)
class RecipieRepository
end
```

## 4. Implement the Model class
```ruby

class Recipie

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :average_cook_time_mins, :rating
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# recipie = Recipie.new
# recipie.name = 'Jo'
# recipie.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

```ruby
class RecipieRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, average_cook_time_mins,rating FROM recipies;

    # Returns an array of recipie objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, average_cook_time_mins, rating FROM recipies WHERE id = $1;

    # Returns a single recipie object.
  end

end
```

## 6. Write Test Examples

```ruby
# 1
# Get all recipies

repo = RecipieRepository.new

recipies = repo.all

recipies.length # => 2

recipies[0].id # =>  1
recipies[0].name # =>  'Lasagne'
recipies[0].average_cook_time_mins # =>  '100'
recipies[0].rating # =>  '4'

recipies[1].id # =>  2
recipies[1].name # =>  'Pizza'
recipies[1].average_cook_time_mins # =>  '25'
recipies[1].rating # =>  '4'

# 2
# Get a single recipie

repo = RecipieRepository.new

recipie = repo.find(1)

recipie.id # =>  1
recipie.name # =>  'Lasagne'
recipie.average_cook_time_mins # =>  '100'
recipie.rating # => '4'

# 3
# Get a different single recipie

repo = RecipieRepository.new

recipie = repo.find(2)

recipie.id # =>  2
recipie.name # =>  'Pizza'
recipie.average_cook_time_mins # =>  '25'
recipie.rating # => '4'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run



```ruby


def reset_recipies_table
  seed_sql = File.read('spec/seeds_recipies.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipies' })
  connection.exec(seed_sql)
end

describe recipieRepository do
  before(:each) do 
    reset_recipies_table
  end

  # tests will go here
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->