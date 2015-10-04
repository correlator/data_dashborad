FactoryGirl.define do
  factory :page do
    name { FFaker::Name.first_name }
    title 'Some Title'
    intro_text 'the bed is big'
    category_id nil
    admin_id nil
  end
end
