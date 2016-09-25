require 'test_helper'

class VolunteerMailerTest < ActionMailer::TestCase
  test "new_deputation" do
    mail = VolunteerMailer.new_deputation
    assert_equal "New deputation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
