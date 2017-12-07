# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::UsersController do
  it { should be_a(Backoffice::BaseController) }

  it { should use_before_action(:authenticate!) }

  describe '#index.json' do
    context 'authorized' do
      let!(:session) { create(:backoffice_session) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { get :index, format: :json }

      it { should render_template(:index) }

      it { should respond_with(:ok) }
    end

    context 'not authorized' do
      before { get :index, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end

  describe '#show.json' do
    context 'authorized' do
      let!(:user) { create(:user) }

      let!(:session) { create(:backoffice_session) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { get :show, params: { id: user.id }, format: :json }

      it { should render_template(:show) }

      it { should respond_with(:ok) }
    end

    context 'not authorized' do
      let!(:user) { create(:user) }

      before { get :show, params: { id: user.id }, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end

  describe '#create.json' do
    context 'authorized' do
      let!(:session) { create(:backoffice_session) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { post :create, params: { user: attributes_for(:user) }, format: :json }

      it { should render_template(:create) }

      it { should respond_with(:created) }
    end

    context 'not authorized' do
      before { post :create, params: { user: attributes_for(:user) }, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end

  describe '#update.json' do # rubocop:disable Metrics/BlockLength
    context 'PUT' do
      context 'authorized' do
        let!(:user) { create(:user) }

        let!(:session) { create(:backoffice_session) }

        before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

        before { put :update, params: { id: user.id, user: attributes_for(:user) }, format: :json }

        it { should render_template(:update) }

        it { should respond_with(:ok) }
      end

      context 'not authorized' do
        let!(:user) { create(:user) }

        before { put :update, params: { id: user.id }, format: :json }

        it { should respond_with(:unauthorized) }
      end
    end

    context 'PATCH' do
      context 'authorized' do
        let!(:user) { create(:user) }

        let!(:session) { create(:backoffice_session) }

        before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

        before { patch :update, params: { id: user.id, user: attributes_for(:user) }, format: :json }

        it { should render_template(:update) }

        it { should respond_with(:ok) }
      end

      context 'not authorized' do
        let!(:user) { create(:user) }

        before { patch :update, params: { id: user.id }, format: :json }

        it { should respond_with(:unauthorized) }
      end
    end
  end

  describe '#destroy.json' do
    context 'authorized' do
      let!(:user) { create(:user) }

      let!(:session) { create(:backoffice_session) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { delete :destroy, params: { id: user.id }, format: :json }

      it { should respond_with(:no_content) }
    end

    context 'not authorized' do
      let!(:user) { create(:user) }

      before { delete :destroy, params: { id: user.id }, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end

  # private methods

  describe '#build_resource' do
    let(:resource_params) { ActionController::Parameters.new(email: Faker::Internet.email, password: Faker::Internet.password).permit! }

    let(:user) { Backoffice::User.new(resource_params) }

    before { allow(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Backoffice::User).to receive(:new).with(resource_params).and_return(user) }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@user) }.from(nil).to(user) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }
  end

  describe '#resource' do
    context '@user is set' do
      let(:user) { double }

      before { subject.instance_variable_set(:@user, user) }

      specify { expect(subject.send(:resource)).to eq(user) }
    end

    context '@user not set' do
      let(:user) { stub_model Backoffice::User, id: 42 }

      let(:params) { { id: '42' } }

      before { expect(subject).to receive(:params).and_return(params) }

      before { expect(Backoffice::User).to receive(:find).with(params[:id]).and_return(user) }

      specify { expect { subject.send(:resource) }.not_to raise_error }

      specify { expect { subject.send(:resource) }.to change { subject.instance_variable_get(:@user) }.from(nil).to(user) }
    end
  end

  describe '#resource_params' do
    before do
      #
      # subject.params.require(:user).permit(:email, :password, :password_confirmation)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:require).with(:user) do
            double.tap do |b|
              expect(b).to receive(:permit).with(:email, :password, :password_confirmation)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:resource_params) }.not_to raise_error }
  end

  describe '#collection' do
    context '@users is set' do
      let(:users) { double }

      before { subject.instance_variable_set(:@users, users) }

      specify { expect(subject.send(:collection)).to eq(users) }
    end

    context '@users not set' do
      let(:users) { double }

      before do
        #
        # Backoffice::User.order(id: :asc).page(params[:page]) => users
        #
        expect(Backoffice::User).to receive(:order).with(id: :asc) do
          double.tap do |a|
            expect(a).to receive(:page).with(nil).and_return(users)
          end
        end
      end

      specify { expect { subject.send(:collection) }.not_to raise_error }

      specify { expect { subject.send(:collection) }.to change { subject.instance_variable_get(:@users) }.from(nil).to(users) }
    end
  end
end
