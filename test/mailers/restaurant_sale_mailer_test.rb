require 'test_helper'

class RestaurantSaleMailerTest < ActionMailer::TestCase
  test "new_sale" do
    mail = RestaurantSaleMailer.new_sale
    assert_equal "New sale", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
