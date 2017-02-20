require 'rails_helper'

describe Backoffice do
  it { expect(described_class.table_name_prefix).to eq('backoffice_') }
end
