unless Rails.env.production?
  class ChangeEmailSubject
    def self.delivering_email(mail)
      mail.subject = "[TEST] #{mail.subject}"
    end
  end
  ActionMailer::Base.register_interceptor(ChangeEmailSubject)
end
