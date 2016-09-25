class VolunteerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.volunteer_mailer.new_deputation.subject
  #
  def new_deputation(deputation)
    @deputation = deputation
    @volunteers = Presenter.all

    @volunteers.each do |user|
      mail to: user.email, subject: "New deputation video up for adoption!"
    end
  end
end
