require 'test_helper'

class OrderReadyMailerTest < ActionMailer::TestCase
  test "order_ready" do
    mail = OrderReadyMailer.order_ready
    assert_equal "Order ready", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
