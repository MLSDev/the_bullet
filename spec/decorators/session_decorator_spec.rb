# frozen_string_literal: true

require 'rails_helper'

describe SessionDecorator do
  describe '#as_json' do
    let!(:user) { create(:user) }

    let!(:session) { create(:session, user: user) }

    subject { session.decorate.as_json }

    its([:user]) { should eq(user) }

    its([:token]) { should eq(session.token) }
  end
end
