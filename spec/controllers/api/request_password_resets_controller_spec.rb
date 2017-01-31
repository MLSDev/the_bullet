require 'rails_helper'

describe Api::RequestPasswordResetsController do
  it { should be_a(Api::BaseController) }

  it { should_not use_before_action(:authenticate) }

  describe '#create.json' do
    context 'successful' do
      let!(:user) { create(:user) }

      before do
        post :create, params: { email: user.email, format: :json }
      end

      it { should respond_with(:ok) }
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

    let(:request_password_reset) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Api::RequestPasswordReset).to receive(:new).with(resource_params).and_return(request_password_reset) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@request_password_reset) }.from(nil).to(request_password_reset) }
  end

  describe '#resource' do
    let(:request_password_reset) { double }

    before { subject.instance_variable_set(:@request_password_reset, request_password_reset) }

    specify { expect(subject.send(:resource)).to eq(request_password_reset) }
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
