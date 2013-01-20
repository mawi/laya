# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_setting do
    name "MyString"
    value "MyString"
    project nil
  end
end
