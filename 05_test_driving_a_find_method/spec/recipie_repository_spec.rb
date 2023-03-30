require 'recipie_repository'

describe RecipieRepository do

  def reset_recipies_table
    seed_sql = File.read('spec/seeds_recipies.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipies' })
    connection.exec(seed_sql)
  end
  
  describe RecipieRepository do
    before(:each) do 
      reset_recipies_table
    end
  end

  it 'should find all recipies' do
    repo = RecipieRepository.new
    recipies = repo.all

    expect(recipies.length).to eq (2)

    expect(recipies[0].id).to eq ('1')
    expect(recipies[0].name).to eq('Lasagne')
    expect(recipies[0].average_cook_time_mins).to eq('100')
    expect(recipies[0].rating).to eq('4')
    
    expect(recipies[1].id).to eq('2')
    expect(recipies[1].name).to eq('Pizza')
    expect(recipies[1].average_cook_time_mins).to eq('25')
    expect(recipies[1].rating).to eq('4')
  end

  xit 'returns a single Lasagne recipie' do
    repo = RecipieRepository.new
    recipie = repo.find(1)
    
    expect(recipie.id).to eq(1)
    expect(recipie.name).to eq('Lasagne')
    expect(recipie.average_cook_time_mins).to eq('100')
    expect(recipie.rating).to eq('4')
  end


  xit 'returns a single Pizza recipie' do
    repo = RecipieRepository.new
    recipie = repo.find(2)

    expect(recipie.id).to eq(2)
    expect(recipie.name).to eq('Pizza')
    expect(recipie.average_cook_time_mins).to eq('25')
    expect(recipie.rating).to eq('4')
  end
end







