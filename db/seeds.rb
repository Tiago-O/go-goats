require "open-uri"

puts 'Deleting users, goats, reservations & reviews'
Review.destroy_all
Reservation.destroy_all
Goat.destroy_all
User.destroy_all

puts 'Creating users: Tiago, Felipe & Diogo, with pictures, that own goats...'
owner_tiago = User.create(name: 'Tiago', address: 'Penafiel', email: 'tiago@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/63858592?v=4')
owner_tiago.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
owner_tiago.save

owner_felipe = User.create(name: 'Felipe', address: 'Avelar', email: 'felipe@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/75455106?v=4')
owner_felipe.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
owner_felipe.save

owner_diogo = User.create(name: 'Diogo', address: 'Lisboa', email: 'diogo@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/76879710?v=4')
owner_diogo.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
owner_diogo.save

puts 'Creating 3 users, with pictures, that need goats! ...'
maria = User.create(name: 'Maria', address: 'Lousã', email: 'maria@me.pt', password: '123456')
file = URI.open('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2134&q=80')
maria.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
maria.save

joachim = User.create(name: 'Joachim', address: 'Alvito', email: 'joachim@me.pt', password: '123456')
file = URI.open('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80')
joachim.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
joachim.save

elsa = User.create(name: 'Elsa', address: 'Melgaço', email: 'elsa@me.pt', password: '123456')
file = URI.open('https://images.unsplash.com/photo-1521755985926-3433a1d0a769?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2134&q=80')
elsa.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
elsa.save

puts "created #{User.count} users"

puts 'Creating goat herds, with pictures...'
goats_tiago = Goat.create(user: owner_tiago, location: 'Nelas', number: 100, description: Faker::Lorem.paragraph(sentence_count: 2), price: 50)
file = URI.open('https://images.unsplash.com/photo-1532356948574-9f03b5dcd0b3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2172&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1560819400-434c188f63ef?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80')
goats_tiago.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
goats_tiago.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
goats_tiago.save

goats_felipe = Goat.create(user: owner_felipe, location: 'Lagos, Portugal', number: 50, description: Faker::Lorem.paragraph(sentence_count: 2), price: 60)
file = URI.open('https://images.unsplash.com/photo-1593750439808-958d28558592?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2104&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1610660337872-35efd9bde8c8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2135&q=80')
goats_felipe.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
goats_felipe.save
goats_felipe.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
goats_felipe.save

goats_diogo = Goat.create(user: owner_diogo, location: 'Castelo Branco', number: 150, description: Faker::Lorem.paragraph(sentence_count: 2), price: 55)
file = URI.open('https://images.unsplash.com/photo-1613846043689-afad9cb6317d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2104&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1587829450712-2d3fb7673eb0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2167&q=80')
goats_diogo.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
goats_diogo.save
goats_diogo.photos.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')
goats_diogo.save

puts "created #{Goat.count} goat herds"

puts 'Creating reservations...'
Reservation.create(location: 'Lousã', start_date: Date.today + 7.day, end_date: Date.today + 14.day, user: maria, goat: goats_tiago)
Reservation.create(location: 'Alvito', start_date: Date.today + 14.day, end_date: Date.today + 21.day, user: joachim, goat: goats_felipe)
Reservation.create(location: 'Melgaço', start_date: Date.today + 21.day, end_date: Date.today + 28.day, user: elsa, goat: goats_diogo)

puts "Created #{Reservation.count} reservations"

puts 'Creating reviews...'
Review.create(rating: 3, comment: Faker::Lorem.sentence(word_count: 20), user: elsa, goat: goats_tiago)
Review.create(rating: 5, comment: Faker::Lorem.sentence(word_count: 20), user: maria, goat: goats_tiago)
Review.create(rating: 5, comment: Faker::Lorem.sentence(word_count: 20), user: elsa, goat: goats_felipe)
Review.create(rating: 4, comment: Faker::Lorem.sentence(word_count: 20), user: joachim, goat: goats_felipe)
Review.create(rating: 5, comment: Faker::Lorem.sentence(word_count: 20), user: elsa, goat: goats_diogo)
Review.create(rating: 3, comment: Faker::Lorem.sentence(word_count: 20), user: maria, goat: goats_diogo)

puts "Created #{Review.count} reviews"

puts 'seeds created'
