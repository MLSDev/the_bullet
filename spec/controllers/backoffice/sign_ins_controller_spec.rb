require 'rails_helper'

describe Backoffice::SignInsController do
  it { should be_a(Backoffice::BaseController) }

  it { should_not use_before_action(:authenticate!) }

  describe '#create.json' do
    context 'successful authorization' do
      let!(:superuser) { create(:backoffice_superuser, password: 'password') }

      before do
        post :create, params: { email: superuser.email, password: 'password', format: :json }
      end

      it { should render_template(:create) }

      it { should respond_with(:ok) }
    end

    context 'failed authorization' do
      before do
        post :create, params: { email: 'me@example.com', password: 'password', format: :json }
      end

      it { should render_template(:errors) }

      it { should respond_with(:unprocessable_entity) }
    end
  end

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:sign_in) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Backoffice::SignIn).to receive(:new).with(resource_params).and_return(sign_in) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@sign_in) }.from(nil).to(sign_in) }
  end

  describe '#resource' do
    let(:sign_in) { double }

    before { subject.instance_variable_set(:@sign_in, sign_in) }

    specify { expect(subject.send(:resource)).to eq(sign_in) }
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
