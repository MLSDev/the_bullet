require 'rails_helper'

describe Backoffice::User do
  it { should be_a(User) }

  it { expect(described_class.table_name).to eq('users') }
end
