class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)


    @greeting = "Hi"

    @form = user
    @notes=user.notes
    @url = Form.find(@form.id)
  mail to: user.email, subject: "Анкета в лагерь"
  end
end
