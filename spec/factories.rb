Factory.define :user do |user|

  user.user_name              "test_user@test.com"
  user.password               "12345678"
  user.password_confirmation  "12345678"
  user.first_name             "Test"
  user.last_name              "My User"
  user.plan_user_id           1
  user.role_id                2
  user.site_profile_id        1
  user.pricing_plan_id        1
  user.plan_balance_id        1 
  user.registered_on          "2010/12/28"
  user.has_agreed_to_privacy_policy    true 
  user.created_by_user_id     1
  user.updated_by_user_id     1
  
end