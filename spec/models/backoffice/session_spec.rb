# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::Session do
  it { should be_a(ApplicationRecord) }

  it { should belong_to(:superuser) }

  pending { should have_secure_token }
end
