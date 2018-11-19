class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user, message)

    @message= message
    @greeting = "Hi"

    @form = user

  mail to: user.email, subject: "Sign Up Confirmation"
  end
end
