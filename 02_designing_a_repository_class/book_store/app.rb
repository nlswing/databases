# file: app.rb
require_relative 'lib/book_repository'
require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')
book_repository = BookRepository.new
book_repository.all.each do |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}"
end
