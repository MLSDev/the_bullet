FactoryBot.define do
  factory :backoffice_superuser, class: 'Backoffice::Superuser' do
    email { Faker::Internet.email }

    password { Faker::Internet.password }
  end
end
