class UserMailer < ActionMailer::Base

  default from: Settings.mailer.user_name

  def new_images(recipient)
    @url  = root_url
    @name = recipient.name
    mail(to: recipient.email, subject: " Hi #{@name}! New Image has been created")
  end

end
