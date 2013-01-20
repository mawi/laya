FactoryGirl.define do
  factory :admin, class: User do
    sequence(:email) {|n| "admin#{n}@laya.com" }
    password "123456"
    password_confirmation "123456"
    approved true
    is_admin true
  end

  factory :user, class: User do
    sequence(:email) {|n| "user#{n}@laya.com" }
    password "123456"
    password_confirmation "123456"
    approved true
    is_admin false
  end

  factory :guest, class: User do
    sequence(:email) {|n| "guest#{n}@laya.com" }
    password "123456"
    password_confirmation "123456"
    approved false
    is_admin false
  end

end