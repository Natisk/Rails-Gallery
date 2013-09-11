class UserMailer < ActionMailer::Base

  default :from => 'emailfaceit@gmail.com'

  def self.send_new_images
    category = Category.where('id = :id', id: params[:category_id]).first
    @recipients = category.users
    @recipients.each do |recipient|
      new_images(recipient).deliver
    end
  end

  def new_images(recipient)
    @url  = root_url
    @name = recipient.name
    mail(to: recipient.email, subject: 'New Image has been created')
  end

end
