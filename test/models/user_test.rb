require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_user_authenticates_via_password
  	original_user = User.create(:username => "john", :password => "bossman")

  	authenticated_user = User.authenticate(:username => "john", :password => "bossman")
  	assert_equal original_user, authenticated_user
  end 

  def test_user_fails_authentication
  	original_user = User.create(:username => "john", :password => "little")

  	failed_user = User.authenticate(:username => "john", :password => "little")

  	refute failed_user, "User should have failed authentication."
  end
end
