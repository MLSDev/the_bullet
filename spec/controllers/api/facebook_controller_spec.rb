require 'rails_helper'

describe Api::FacebookController do
  it { should be_a(Api::BaseController) }

  it { should_not use_before_action(:authenticate!) }

  # private methods

  describe '#build_resource' do
    let(:resource_params) { double }

    let(:facebook) { double }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(Api::Facebook).to receive(:new).with(resource_params).and_return(facebook) }

    specify { expect { subject.send(:build_resource) }.not_to raise_error }

    specify { expect { subject.send(:build_resource) }.to change { subject.instance_variable_get(:@facebook) }.from(nil).to(facebook) }
  end

  describe '#resource' do
    let(:facebook) { double }

    before { subject.instance_variable_set(:@facebook, facebook) }

    specify { expect(subject.send(:resource)).to eq(facebook) }
  end

  describe '#resource_params' do
    before do
      #
      # subject.params.permit(:facebook_access_token)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:permit).with(:facebook_access_token)
        end
      end
    end

    specify { expect { subject.send(:resource_params) }.not_to raise_error }
  end
end
