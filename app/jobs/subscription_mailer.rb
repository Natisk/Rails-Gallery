class SubscriptionMailer

  @queue = :subscription

  def self.perform(image_id)
    image = Image.find(image_id)
    category = Category.includes(:users).find(image.category_id)
    unless category.users.empty?
      category.users.each do |recipient|
        UserMailer.new_images(recipient).deliver
      end
    end
  end

end