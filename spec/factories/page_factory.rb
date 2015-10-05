FactoryGirl.define do
  factory :page do
    name { FFaker::Name.first_name }
    order 1
    intro_text 'the bed is big'
    category_id nil
    admin_id nil
  end
end
