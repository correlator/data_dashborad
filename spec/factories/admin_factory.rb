FactoryGirl.define do
  factory :admin do
    email { FFaker::Internet.email }
    password '1234567890'
    password_confirmation '1234567890'
    super_admin nil
  end
end
