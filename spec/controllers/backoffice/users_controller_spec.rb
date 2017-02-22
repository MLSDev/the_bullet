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

  describe '#create.json' # TODO: write

  describe '#update.json' # TODO: write

  describe '#destroy.json' do
    context 'authorized' do
      let!(:user) { create(:user) }

      let!(:session) { create(:backoffice_session) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { delete :destroy, params: { id: user.id }, format: :json }

      it { should respond_with(:ok) }
    end

    context 'not authorized' do
      let!(:user) { create(:user) }

      before { delete :destroy, params: { id: user.id }, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end

  # private methods
  # TODO: write
end
