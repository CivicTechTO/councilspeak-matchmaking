class LoginMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_mailer.login_link.subject
  #
  def login_link(user)
    @user = user

    mail to: @user.email, subject: "Sing-in for CouncilSpeak Matchmaking"
  end
end
