FactoryGirl.define do
  factory :category do
    name { FFaker::Name.first_name }
    admin_id nil
    order 1
  end
end
