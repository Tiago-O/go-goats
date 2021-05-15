
puts 'Delete users, goats, reservations & reviews'
User.destroy_all
Goat.destroy_all
Reservation.destroy_all
Review.destroy_all

puts 'Creating users: Tiago, Felipe & Diogo'
User.create(name: 'Tiago', address: 'Arroios', mail: 'tiago@me.pt', password: '123456')
User.create(name: 'Felipe', address: 'Intendente', mail: 'felipe@me.pt', password: '123456')
User.create(name: 'Diogo', address: 'Alvalade', mail: 'diogo@me.pt', password: '123456')

puts 'Creating goats'
Goats.create(name: 'Rebanho do Tiago', user: )
