require 'rails_helper'

describe Api::V1::PasswordResetsController do
  it { should be_a(Api::V1::BaseController) }

  it { should_not use_before_action(:authenticate) }

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:password_reset) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Api::PasswordReset).to receive(:new).with(resource_params).and_return(password_reset) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@password_reset) }.from(nil).to(password_reset) }
  end

  describe '#resource' do
    let(:password_reset) { double }

    before { subject.instance_variable_set(:@password_reset, password_reset) }

    specify { expect(subject.send(:resource)).to eq(password_reset) }
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
