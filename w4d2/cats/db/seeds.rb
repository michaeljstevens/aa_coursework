# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create(birth_date: "2015/01/20", color: "black", name: "joey", sex: "M", description: "black cat named joey")
Cat.create(birth_date: "2014/08/28", color: "calico", name: "yentl", sex: "F", description: "calico cat named yentl")
Cat.create(birth_date: "2013/04/10", color: "brown", name: "rawelna", sex: "F", description: "brown cat named rawelna")
Cat.create(birth_date: "2012/03/20", color: "white", name: "bertbert", sex: "M", description: "white cat named bertbert")
