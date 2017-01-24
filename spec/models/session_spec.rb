require 'rails_helper'

describe Session do
  it { should belong_to(:user) }

  it { should validate_presence_of(:user) }

  pending { should have_secure_token }
end
