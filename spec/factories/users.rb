FactoryGirl.define do
  factory :user do
    email 'fancyfrank@gmail.com'
    user_name 'Arnie'
    password 'illbeback'
    id 1
  end
end

# Creates an ActiveRecord user object with the above details for each column in
# the row for this user.
