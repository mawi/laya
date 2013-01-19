# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "Name"
    description "Description"


    ignore do
         clients_count 1
    end

    factory :project_with_clients do
      after(:create) do |project, evaluator|
         FactoryGirl.create_list(:client, evaluator.clients_count, project: project)
      end
    end

  end
end
