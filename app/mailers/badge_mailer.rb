class BadgeMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def badge_and_comment(badge, email, message)
    @badge = badge
    @email = email
    @message = message
    mail(:to => email, :subject => "A badge from #{@current_user.email}!")
  end
end
