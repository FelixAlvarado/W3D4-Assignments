# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([{username: 'Charlie'}, {username: 'Bob'}, {username: 'Ned'},
{username: 'Lou'}, {username: 'Kevin'}, {username: 'Melissa'}])

polls = Poll.create([{title: 'Cars', author_id: 1}, {title: 'Boats', author_id: 1},
{title: 'Food', author_id: 2} ])

questions = Question.create([{text: 'How many wheels?',poll_id: 1}, {text: 'What color?',poll_id: 1},
{text: 'Is it a steamboat?',poll_id: 2}, {text: 'What amenities?', poll_id:2}, {text: 'What kind of food?', poll_id:3},
{text: 'Main ingredient?',poll_id: 3}])

answer_choices = AnswerChoice.create([{text: '4', question_id: 1}, {text: '18',question_id: 1},
{text: 'Red', question_id:2}, {text: 'Blue?', question_id:2}, {text: 'Yes', question_id:3},
{text: 'No', question_id:3}, {text: 'Bathroom',question_id: 4}, {text: 'Kitchen',question_id: 4},
{text: 'Pizza', question_id:5}, {text: 'Burger', question_id:5}, {text: 'Bread',question_id: 6},
{text: 'Corn', question_id:6}])

responses = Response.create([{user_id: 1, answer_id: 1}, {user_id:1 , answer_id: 3},
{user_id:1 , answer_id: 5 },{user_id: 1, answer_id: 7},{user_id:1 , answer_id: 9},
{user_id: 1, answer_id: 11},{user_id: 2, answer_id: 2},{user_id: 2, answer_id: 4},
{user_id: 2, answer_id: 6},{user_id:3 , answer_id: 1},{user_id: 3, answer_id: 3},
{user_id:4 , answer_id: 3},{user_id:4 , answer_id: 5}])
