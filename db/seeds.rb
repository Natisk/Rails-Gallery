User.destroy_all
puts 'All Users were removed'
Category.destroy_all
puts 'All Categories were removed'

User.create(email: 'asdf@mail.ru', password: '12345678', password_confirmation: '12345678', name: 'John Doe')
puts 'New User has been created'

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
