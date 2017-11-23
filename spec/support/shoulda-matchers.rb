# frozen_string_literal: true

# rubocop:disable Style/FileName
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end
