if ENV['EMAIL_SUBJECT_PREFIX']
  class ChangeEmailSubject
    def self.delivering_email(mail)
      mail.subject = "[#{ENV['EMAIL_SUBJECT_PREFIX']}] #{mail.subject}"
    end
  end
  ActionMailer::Base.register_interceptor(ChangeEmailSubject)
end
