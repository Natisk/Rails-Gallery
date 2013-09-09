# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Comment.destroy_all
Like.destroy_all
Image.destroy_all
User.destroy_all
Category.destroy_all

User.create(email: 'asdf@mail.ru', password: '12345678', password_confirmation: '12345678', name: 'Pupsik')

category = Category.create(title: 'tits')
category.images.create(title: 'Tits first image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_1.png'))))
category.images.create(title: 'Tits second image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_2.jpg'))))
category.images.create(title: 'Tits third image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_3.jpg'))))
category.images.create(title: 'Tits forth image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_4.jpg'))))
category.images.create(title: 'Tits fifth image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_5.jpg'))))
category.images.create(title: 'Tits sixth image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_6.jpg'))))
category.images.create(title: 'Tits seventh image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_7.jpg'))))
category.images.create(title: 'Tits eighth image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_8.jpg'))))
category.images.create(title: 'Tits ninth image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_9.jpg'))))
category.images.create(title: 'Tits tenth image', img_name: (File.open(Rails.root.join('db/data_seed/tits/tits_10.png'))))

category = Category.create(title: 'cats')
category.images.create(title: 'Cats first image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_1.jpg'))))
category.images.create(title: 'Cats second image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_2.jpg'))))
category.images.create(title: 'Cats third image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_3.jpg'))))
category.images.create(title: 'Cats forth image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_4.jpg'))))
category.images.create(title: 'Cats fifth image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_5.jpg'))))
category.images.create(title: 'Cats sixth image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_6.jpg'))))
category.images.create(title: 'Cats seventh image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_7.jpg'))))
category.images.create(title: 'Cats eighth image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_8.jpg'))))
category.images.create(title: 'Cats ninth image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_9.jpg'))))
category.images.create(title: 'Cats tenth image', img_name: (File.open(Rails.root.join('db/data_seed/cats/cat_10.jpg'))))

category = Category.create(title: 'christmas')
category.images.create(title: 'Christmas first image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_1.jpg'))))
category.images.create(title: 'Christmas second image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_2.jpg'))))
category.images.create(title: 'Christmas third image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_3.jpg'))))
category.images.create(title: 'Christmas forth image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_4.jpg'))))
category.images.create(title: 'Christmas fifth image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_5.jpg'))))
category.images.create(title: 'Christmas sixth image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_6.jpg'))))
category.images.create(title: 'Christmas seventh image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_7.jpg'))))
category.images.create(title: 'Christmas eighth image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_8.jpg'))))
category.images.create(title: 'Christmas ninth image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_9.jpg'))))
category.images.create(title: 'Christmas tenth image', img_name: (File.open(Rails.root.join('db/data_seed/christmas/chr_10.jpg'))))

category = Category.create(title: 'alcohol')
category.images.create(title: 'Alcohol first image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_1.jpg'))))
category.images.create(title: 'Alcohol second image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_2.jpg'))))
category.images.create(title: 'Alcohol third image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_3.jpg'))))
category.images.create(title: 'Alcohol forth image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_4.jpg'))))
category.images.create(title: 'Alcohol fifth image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_5.jpg'))))
category.images.create(title: 'Alcohol sixth image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_6.jpg'))))
category.images.create(title: 'Alcohol seventh image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_7.jpg'))))
category.images.create(title: 'Alcohol eighth image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_8.jpg'))))
category.images.create(title: 'Alcohol ninth image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_9.jpg'))))
category.images.create(title: 'Alcohol tenth image', img_name: (File.open(Rails.root.join('db/data_seed/alcohol/alc_10.jpg'))))

category = Category.create(title: 'ruby')
category.images.create(title: 'Ruby first image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_1.jpg'))))
category.images.create(title: 'Ruby second image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_2.jpg'))))
category.images.create(title: 'Ruby third image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_3.jpg'))))
category.images.create(title: 'Ruby forth image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_4.jpg'))))
category.images.create(title: 'Ruby fifth image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_5.jpg'))))
category.images.create(title: 'Ruby sixth image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_6.jpg'))))
category.images.create(title: 'Ruby seventh image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_7.jpg'))))
category.images.create(title: 'Ruby eighth image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_8.jpg'))))
category.images.create(title: 'Ruby ninth image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_9.jpg'))))
category.images.create(title: 'Ruby tenth image', img_name: (File.open(Rails.root.join('db/data_seed/ruby/ruby_10.jpg'))))

