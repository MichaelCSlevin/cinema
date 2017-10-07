require_relative( '../models/customer')
require_relative( '../models/films')
require_relative( '../models/tickets')

require( 'pry-byebug' )


# #deletes all films from the table to remove duplicates and spaces
# Film.delete_all ()


# customer table
customer1 = Customer.new({ 'name' => 'Michael', 'funds' => 30})

# add customer 1 details to database
customer1.save()

#saves customer 1 details to database

customer2 = Customer.new({ 'name' => 'John', 'funds' => 20})
customer2.save()


customer3 = Customer.new({ 'name' => 'Caroline', 'funds' => 8})
customer3.save()

customer4 = Customer.new({ 'name' => 'Hayley', 'funds' => 11})
customer4.save()

film1 = Film.new({'title' => 'It', 'price' => '10'})

#film table

# adds film 1's details to database

film1.save()
# saves film 1's details to datebase

film2 = Film.new({'title' => 'The Mangler', 'price' => '3'})
film2.save()

film3 = Film.new({'title' => 'Carrie', 'price' => '15'})
film3.save()

film4 = Film.new({'title' => 'The Shining', 'price' => '20'})
film4.save()




binding.pry
nil
