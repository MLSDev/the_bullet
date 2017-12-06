# frozen_string_literal: true

require 'rails_helper'

describe Api::SetNewPasswordsController do
  it { should be_a(Api::BaseController) }

  it { should_not use_before_action(:authenticate!) }

  describe '#create.json' do
    context 'successful' do
      let!(:user) { create(:user) }

      before do
        post :create, params: { reset_token: user.reset_token,
                                password: 'new password',
                                password_confirmation: 'new password',
                                format: :json }
      end

      it { should render_template(:create) }

      it { should respond_with(:created) }
    end

    context 'reset token not found' do
      before do
        post :create, params: { reset_token: 'wrong reset token',
                                password: 'new password',
                                password_confirmation: 'new password',
                                format: :json }
      end

      it { should render_template(:errors) }

      it { should respond_with(:unprocessable_entity) }
    end

    context "password and confirmation doesn't match" do
      let!(:user) { create(:user) }

      before do
        post :create, params: { reset_token: user.reset_token,
                                password: 'new password',
                                password_confirmation: 'wrong confirmation',
                                format: :json }
      end

      it { should render_template(:errors) }

      it { should respond_with(:unprocessable_entity) }
    end
  end

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:set_new_password) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Api::SetNewPassword).to receive(:new).with(resource_params).and_return(set_new_password) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@set_new_password) }.from(nil).to(set_new_password) }
  end

  describe '#resource' do
    let(:set_new_password) { double }

    before { subject.instance_variable_set(:@set_new_password, set_new_password) }

    specify { expect(subject.send(:resource)).to eq(set_new_password) }
  end

  describe '#resource_params' do
    before do
      #
      # subject.params.permit(:reset_token, :password, :password_confirmation)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:permit).with(:reset_token, :password, :password_confirmation)
        end
      end
    end

    specify { expect { subject.send(:resource_params) }.not_to raise_error }
  end
end
