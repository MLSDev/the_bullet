require 'rails_helper'

describe Backoffice::SignOutsController do
  it { should be_a(Backoffice::BaseController) }

  it { should use_before_action(:authenticate!) }

  describe '#destroy.json' do
    context 'authorized' do
      let!(:superuser) { create(:backoffice_superuser) }

      let!(:session) { create(:backoffice_session, superuser: superuser) }

      before { request.env['HTTP_AUTHORIZATION'] = "Bearer #{ session.token }" }

      before { delete :destroy, format: :json }

      it { should respond_with(:ok) }
    end

    context 'not authorized' do
      before { delete :destroy, format: :json }

      it { should respond_with(:unauthorized) }
    end
  end
end
