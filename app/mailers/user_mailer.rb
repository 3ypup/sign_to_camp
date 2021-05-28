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

  attachments['pamyatka_leto_2021.pdf'] = File.read('public/files/pamyatka_leto_2021.pdf')

  mail to: user.email, subject: "Вы записали на выезд участника! Ознакомьтесь с памяткой во вложении, котоую мы для Вас составили."
  end
end
