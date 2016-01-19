FactoryGirl.define do
  factory :account do
    sequence :email do |n|
      "any_example#{n}@email.com"
    end

    password '#password'
    password_confirmation '#password'
    active true
    admin false
  end
end
