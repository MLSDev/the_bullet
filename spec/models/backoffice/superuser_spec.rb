# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::Superuser do
  it { should be_a(ApplicationRecord) }

  it { should have_many(:sessions).dependent(:destroy) }

  it { should have_secure_password }
end
