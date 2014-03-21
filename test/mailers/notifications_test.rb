require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "new_movie" do
    mail = Notifications.new_movie
    assert_equal "New movie", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
