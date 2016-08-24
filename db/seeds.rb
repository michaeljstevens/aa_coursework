# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Todo.create(title: 'Chores', body: 'Clean Room, Do Laundry', done: false)
Todo.create(title: 'Apply for job', body: 'You shoudl get a job', done: true)
Todo.create(title: 'Get a horse', body: 'See the farmer about a horse', done: false)
Todo.create(title: 'Build a new house', body: 'The fire destoyred everything', done: false)
Todo.create(title: 'Chore 5', body: 'Do Chore 5', done: true)
