require 'rails_helper'

describe Api::V1::ProfilesController do
  it { should be_a(Api::V1::BaseController) }

  it { should use_before_action(:authenticate) }

  describe '#show.json' do
    context 'authorized' do
      let!(:user) { create(:user) }

      before { sign_in(user) }

      before { get :show, params: { format: :json } }

      it { should render_template(:show) }

      it { should respond_with(:ok) }
    end

    context 'failed authorization' do
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
end
