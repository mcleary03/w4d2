# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all
c1 = Cat.create(name: :fluffy, color: :orange, birth_date: "2012/01/01", sex: :M)
c2 = Cat.create(name: :stinky, color: :black, birth_date: "2013/11/15", sex: :M)
c3 = Cat.create(name: :jingles, color: :calico, birth_date: "2010/08/06", sex: :F)
c4 = Cat.create(name: :james, color: :grey, birth_date: "2016/02/05", sex: :F)
