# frozen_string_literal: true

FactoryBot.define do
  factory :backoffice_session, class: 'Backoffice::Session' do
    association :superuser, factory: :backoffice_superuser

    token { SecureRandom.base58(24) }
  end
end
