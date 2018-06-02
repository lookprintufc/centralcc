# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



	User.create(email: "admin@admin.com", password: '123456')

	card = Card.new do |c|
		c.card_number = "4253843477784843"
		c.card_duedate = "05/2010"
		c.cvc = "213"
		c.brand = "Infinity"
		c.scheme = "Hiper"
		c.bank_name = "Banco Brasco"
		c.country_name = "Brasil"
	end

	card.save!

