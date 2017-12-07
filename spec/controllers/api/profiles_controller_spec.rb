# frozen_string_literal: true

require 'rails_helper'

describe Api::ProfilesController do
  it { should be_a(Api::BaseController) }

  it { should use_before_action(:authenticate!) }

  describe '#show.json' do
    context 'authorized' do
      let!(:user) { create(:user) }

      before { sign_in(user) }

      before { get :show, params: { format: :json } }

      it { should render_template(:show) }

      it { should respond_with(:ok) }
    end

    context 'not authorized' do
      before { get :show, params: { format: :json } }

      it { should respond_with(:unauthorized) }
    end
  end

  # private methods

  describe '#resource' do
    let(:current_user) { double }

    before { expect(subject).to receive(:current_user).and_return(current_user) }

    specify { expect(subject.send(:resource)).to eq(current_user) }
  end

  describe '#create.json' do
    context 'user successfully created' do
      before do
        post :create, params: { profile: {
                                  email: 'me@example.com',
                                  password: 'password',
                                  password_confirmation: 'password',
                                 },
                                 format: :json
                              }
      end

      it { should render_template(:create) }

      it { should respond_with(:created) }
    end

    context 'unprocessable entity' do
      before do
        post :create, params: { profile: {
                                  email: 'me@example.com',
                                  password: 'password',
                                  password_confirmation: 'wrong confirmation',
                                 },
                                format: :json
                              }
      end

      it { should render_template(:errors) }

      it { should respond_with(:unprocessable_entity) }
    end
  end

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:sign_up) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Api::SignUp).to receive(:new).with(resource_params).and_return(sign_up) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@profile) }.from(nil).to(sign_up) }
  end

  describe '#resource' do
    let(:sign_up) { double }

    before { subject.instance_variable_set(:@profile, sign_up) }

    specify { expect(subject.send(:resource)).to eq(sign_up) }
  end

  describe '#resource_params' do
    before do
      #
      # subject.params.permit(:email, :password, :password_confirmation)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:require).with(:profile) do
            double.tap do |b|
              expect(b).to receive(:permit).with(:email, :password, :password_confirmation)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:resource_params) }.not_to raise_error }
  end
end
