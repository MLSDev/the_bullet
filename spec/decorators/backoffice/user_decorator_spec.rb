require 'rails_helper'

describe Backoffice::UserDecorator do
  describe '#as_json' do
    let!(:user) { Backoffice::User.create!(attributes_for(:user)) }

    subject { user.decorate.as_json }

    its([:id]) { should eq(user.id) }

    its([:email]) { should eq(user.email) }

    its([:created_at]) { should eq(user.created_at.iso8601) }

    its([:updated_at]) { should eq(user.updated_at.iso8601) }
  end
end
