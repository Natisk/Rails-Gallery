class UserMailer < ActionMailer::Base

  default :from => 'emailfaceit@gmail.com'

  def new_images(user)
    mail(:to => user.email, :subject => 'New Image has been created')
  end

end
