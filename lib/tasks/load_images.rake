namespace :catalog do

  desc 'Delete users'
  task user_del: :environment do
    User.destroy_all
    puts 'All Users were removed'
  end

  desc 'Delete categories'
  task cat_del: :environment do
    Category.destroy_all
    puts 'All Categories were removed'
  end

  desc 'Delete images'
  task img_del: :environment do
    Image.destroy_all
    puts 'All Images were removed'
  end

  desc 'Create a user'
  task user_create: :environment do
    new_user
    puts 'User has been created'
  end

  desc 'Create categories and load images to a certain category'
  task cat_img: :environment do
    Dir["#{Rails.root}/db/data_seed/*"].each do |dir|              #Pick the folder with seeding data
      cat = Category.create(title: "#{dir.rpartition('/')[2]}")    #Create category according to folder name
      puts "Create category: #{dir.rpartition('/')[2]}\n"
      Dir["#{dir}/*"].each do |image|                              #Get the images from each folder
        puts image.rpartition('/')[2] + ', '
        img_name = image.rpartition('/')[2].rpartition('.')[0]     #Get the file name for db column
        cat.images.create(title: "#{cat.title} #{img_name}",         #Create image
                          img_name: File.open(image))
      end
      puts "\n"
    end
  end

  desc 'Remove Users Categories Images and create new User Categories Images'
  task all: [:user_del, :cat_del, :user_create, :cat_img]

  def new_user
    User.create(email: 'asdf@mail.ru', password: '12345678', password_confirmation: '12345678', name: 'John Doe')
  end

end