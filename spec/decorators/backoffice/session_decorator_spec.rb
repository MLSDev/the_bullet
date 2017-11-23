# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::SessionDecorator do
  describe '#as_json' do
    let!(:session) { create(:backoffice_session) }

    subject { session.decorate.as_json }

    its([:id]) { should eq(session.id) }

    its([:token]) { should eq(session.token) }

    its([:created_at]) { should eq(session.created_at.iso8601) }

    its([:updated_at]) { should eq(session.updated_at.iso8601) }
  end
end
