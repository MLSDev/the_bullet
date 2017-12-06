# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::SessionsController do
  it { should be_a(Backoffice::BaseController) }

  pending { should use_before_action(:authenticate!).only(:destroy) }

  describe '#create' do
    context 'successful authorization' do
      let!(:superuser) { create(:backoffice_superuser, password: 'password') }

      before do
        post :create, params: { email: superuser.email, password: 'password', format: :json }
      end

      it { should render_template(:create) }

      it { should respond_with(:created) }
    end

    context 'failed authorization' do
      before do
        post :create, params: { email: 'me@example.com', password: 'password', format: :json }
      end

      it { should render_template(:errors) }

      it { should respond_with(:unprocessable_entity) }
    end
  end

  describe '#destroy' do
    context 'authorized' do
      let!(:session) { create(:backoffice_session) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { delete :destroy, format: :json }

      it { should respond_with(:no_content) }
    end

    context 'not authorized' do
      before { delete :destroy, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:session) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Backoffice::SignIn).to receive(:new).with(resource_params).and_return(session) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@session) }.from(nil).to(session) }
  end

  describe '#resource' do
    let(:session) { double }

    before { subject.instance_variable_set(:@session, session) }

    specify { expect(subject.send(:resource)).to eq(session) }
  end

  describe '#resource_params' do
    before do
      #
      # subject.params.permit(:email, :password)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:permit).with(:email, :password)
        end
      end
    end

    specify { expect { subject.send(:resource_params) }.not_to raise_error }
  end
end
