FactoryGirl.define do
  factory :authentication_token do
    token "MyString"
    user nil
    expires_at "2023-08-27 20:19:36"
  end
end
