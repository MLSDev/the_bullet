# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::SessionDecorator do
  describe '#as_json' do
    let!(:superuser) { create(:backoffice_superuser) }

    let!(:session) { create(:backoffice_session, superuser: superuser) }

    subject { session.decorate.as_json }

    its([:user]) { should eq(superuser) }

    its([:token]) { should eq(session.token) }
  end
end
