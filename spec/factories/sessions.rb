FactoryGirl.define do
  factory :session do
    user

    token { SecureRandom.base58(24) }
  end
end
