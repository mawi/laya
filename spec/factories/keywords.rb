# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword, :class => 'Keywords' do
    keyword "MyString"
    trigger "MyString"
    plugin nil
  end
end
