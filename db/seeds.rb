# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create(
	[
		{title: 'Psychology'},
		{title: 'Math'},
		{title: 'Other'}
	])

users = User.create(
	[
		{name: 'Vika'},
		{name: 'Masha'},
		{name: 'Alena'}
	])

tests = Test.create(
	[
		{title: '2+2?', 
		level: 1,
		category: categories[1],
		author: users[0]},
		
		{title: '3*3',
		level: 0,
		category: categories[1],
		author: users[0]},

		{title: '2/2',
		level: 2,
		category: categories[1],
		author: users[0]}
	])

question = Question.create (
		{body: 'Easy math',
		test: tests[1]}
		)

answers = Answer.create (
	[
		{body: '4',
		correct: true,
		question: question}, 
		{body: '2',
		correct: false,
		question: question}
	])
