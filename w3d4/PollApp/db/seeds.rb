# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(:user_name => "Sara")
User.create!(:user_name => "Sam")
User.create!(:user_name => "Michael")
User.create!(:user_name => "Jeff")

Poll.create!(:title => "Poll One", :author_id => 1 )
Poll.create!(:title => "Poll Two", :author_id => 2 )
Poll.create!(:title => "Poll Three", :author_id => 3 )
Poll.create!(:title => "Poll Four", :author_id => 1 )

Question.create!(:text => "This is my question", :poll_id => 1)
Question.create!(:text => "This my second question", :poll_id => 1)
Question.create!(:text => "This another question", :poll_id => 2)
Question.create!(:text => "I have so many questions", :poll_id => 3)
Question.create!(:text => "This is my question again", :poll_id => 3)

AnswerChoice.create!(:text => "Answer A", :question_id => 1)
AnswerChoice.create!(:text => "Answer B", :question_id => 2)
AnswerChoice.create!(:text => "Answer C", :question_id => 3)
AnswerChoice.create!(:text => "Answer D", :question_id => 4)
AnswerChoice.create!(:text => "Answer E", :question_id => 5)

Response.create!(:user_id => 1, answer_choice_id: 1)
Response.create!(:user_id => 2, answer_choice_id: 2)
Response.create!(:user_id => 3, answer_choice_id: 4)
Response.create!(:user_id => 1, answer_choice_id: 2)
Response.create!(:user_id => 2, answer_choice_id: 3)
