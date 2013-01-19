FactoryGirl.define do
  factory :admin, class: User do
    email "admin@laya.com"
    password "123456"
    password_confirmation "123456"
    approved true
    is_admin true
  end

  factory :user, class: User do
    email "user@laya.com"
    password "123456"
    password_confirmation "123456"
    approved true
    is_admin false
  end

end