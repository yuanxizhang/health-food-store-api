require 'test_helper'

class OutOfStockNotifierMailerTest < ActionMailer::TestCase
  test "invite" do
    # Send the email, then test that it got queued
    email = OutOfStockNotifierMailer.create_invite('healthfoodstore99@gmail.com',
                                     'healthfoodstore99@gmail.com', Time.now).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['healthfoodstore99@gmail.com'], email.from
    assert_equal ['healthfoodstore99@gmail.com'], email.to
    assert_equal 'You have been invited by me@example.com', email.subject
    assert_equal read_fixture('invite').join, email.body.to_s
  end
end
