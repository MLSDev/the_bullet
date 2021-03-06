# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    user

    token { SecureRandom.base58(24) }
  end
end
