FactoryGirl.define do
  factory :admin, class: AdminUser do
    email "admin@laya.com"
    password "123456"
    password_confirmation "123456"
    approved true
  end

  factory :user, class: AdminUser do
    email "user@laya.com"
    password "123456"
    password_confirmation "123456"
  end

end