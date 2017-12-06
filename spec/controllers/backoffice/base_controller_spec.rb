# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::BaseController do
  it { should be_a(ApplicationController) }

  it { should use_before_action(:authenticate!) }

  # private methods

  describe '#authenticate!' do
    let!(:superuser) { create(:backoffice_superuser) }

    let!(:session) { create(:backoffice_session, superuser: superuser) }

    before { expect(subject).to receive(:authenticate_or_request_with_http_token).and_yield(session.token) }

    specify { expect(subject.send(:authenticate!)).to eq(superuser) }
  end
end
