# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.destroy_all
Like.destroy_all
Image.destroy_all
User.destroy_all
Category.destroy_all

User.create(email: 'asdf@mail.ru', password: '12345678', password_confirmation: '12345678', name: 'Pupsik')

category = Category.create(title: 'tits')
category.images.create(title: 'Tits first image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_1.png'))))

Category.create(title: 'cats')
Category.create(title: 'christmas')
Category.create(title: 'alcohol')
Category.create(title: 'ruby')


