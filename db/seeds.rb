# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
landing = Category.where(name: 'Landing Page', hidden: true).first_or_create
Category.where(name: 'Hidden Category', hidden: true).first_or_create
Page.where(name: 'Landing Page', landing_page: true, category_id: landing.id).first_or_create
