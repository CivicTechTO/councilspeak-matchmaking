# Preview all emails at http://localhost:3000/rails/mailers/volunteer_mailer
class VolunteerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/volunteer_mailer/new_deputation
  def new_deputation
    VolunteerMailer.new_deputation
  end

end
