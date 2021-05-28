class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #

def new_form(user, url)


    @greeting = "Hi"

    @form = user

    @url = url


  mail to: user.email, subject: "Новая анкета"
  end



  def signup_confirmation(user, url)


    @greeting = "Hi"

    @form = user
    @notes=user.notes
    @url = url


  mail to: user.email, subject: "Анкета в лагерь"
  end



  def success_confirmation(user, url)


    @greeting = "Hi"

    @form = user
    @notes=user.notes
    @url = url

  attachments['памятка 2021 26 мая.pdf'] = File.read('public\files\памятка 2021 26 мая.pdf')

  mail to: user.email, subject: "Вы записали в лагерь участника!"
  end
end
