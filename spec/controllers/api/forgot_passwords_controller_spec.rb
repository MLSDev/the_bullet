# frozen_string_literal: true

require 'rails_helper'

describe Api::ForgotPasswordsController do
  it { should be_a(Api::BaseController) }

  it { should_not use_before_action(:authenticate!) }

  describe '#create.json' do
    context 'successful' do
      let!(:user) { create(:user) }

      before do
        post :create, params: { email: user.email, format: :json }
      end

      it { should respond_with(:created) }
    end

    context 'email not found' do
      before do
        post :create, params: { email: 'me@example.com', format: :json }
      end

      it { should render_template(:errors) }

      it { should respond_with(:unprocessable_entity) }
    end
  end

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:forgot_password) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Api::ForgotPassword).to receive(:new).with(resource_params).and_return(forgot_password) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@forgot_password) }.from(nil).to(forgot_password) }
  end

  describe '#resource' do
    let(:forgot_password) { double }

    before { subject.instance_variable_set(:@forgot_password, forgot_password) }

    specify { expect(subject.send(:resource)).to eq(forgot_password) }
  end

  describe '#resource_params' do
    before do
      #
      # subject.params.permit(:email)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:permit).with(:email)
        end
      end
    end

    specify { expect { subject.send(:resource_params) }.not_to raise_error }
  end
end
