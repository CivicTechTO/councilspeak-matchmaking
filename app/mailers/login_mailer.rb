class LoginMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_mailer.login_link.subject
  #
  def login_link(user)
    @user = user
    @host = ENV['HEROKU_APP_NAME'] ? "#{ENV['HEROKU_APP_NAME']}.herokuapp.com" : "localhost:3000"

    mail to: @user.email, subject: "Login for CouncilSpeak Matchmaking"
  end
end
