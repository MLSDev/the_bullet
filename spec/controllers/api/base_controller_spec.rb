# frozen_string_literal: true

require 'rails_helper'

describe Api::BaseController do
  it { should be_a(ApplicationController) }

  # private methods

  describe '#authenticate' do
    let!(:user) { create(:user) }

    let!(:session) { create(:session, user: user) }

    before { expect(subject).to receive(:authenticate_with_http_token).and_yield(session.token) }

    specify { expect(subject.send(:authenticate)).to eq(user) }
  end

  describe '#authenticate!' do
    let!(:user) { create(:user) }

    let!(:session) { create(:session, user: user) }

    before { expect(subject).to receive(:authenticate_or_request_with_http_token).and_yield(session.token) }

    specify { expect(subject.send(:authenticate!)).to eq(user) }
  end
end
