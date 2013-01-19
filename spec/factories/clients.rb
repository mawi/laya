# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name "Client"
    user
    project

    factory :client_full do
      association :user, factory: :admin
      association :project, factory: :project

    end


  end
end
