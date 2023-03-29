require "book_repository"

RSpec.describe BookRepository do

  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end

  it "returns the lists of books" do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 2
    expect(books.first.title).to eq 'Emma'
    expect(books.first.author_name).to eq 'Jane Austen'
    expect(books.first.id).to eq '1'

    expect(books.length).to eq 2
    expect(books.last.title).to eq 'Dracula'
    expect(books.last.author_name).to eq 'Bram Stoker'
    expect(books.last.id).to eq '2'

  end
end