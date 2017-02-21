require 'rails_helper'

describe Backoffice::BaseController do
  it { should be_a(ApplicationController) }

  it { should use_before_action(:authenticate!) }

  describe '#current_user' do
    let!(:superuser) { create(:backoffice_superuser) }

    before { subject.instance_variable_set(:@current_user, superuser) }

    specify { expect(subject.current_user).to eq(superuser) }
  end

  describe '#show' do
    let(:resource) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    specify { expect { subject.show }.not_to raise_error }
  end

  describe '#create' do
    let(:resource) { double }

    before { expect(subject).to receive(:build_resource) }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:save!) }

    specify { expect { subject.create }.not_to raise_error }
  end

  describe '#update' do
    let(:resource) { double }

    let(:resource_params) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(subject).to receive(:resource_params).and_return(resource_params) }

    before { expect(resource).to receive(:update!).with(resource_params) }

    specify { expect { subject.update }.not_to raise_error }
  end

  describe '#destroy' do
    let(:resource) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:destroy!) }

    before { expect(subject).to receive(:head).with(:ok) }

    specify { expect { subject.destroy }.not_to raise_error }
  end

  it { should rescue_from(ActionController::ParameterMissing) }

  it { should rescue_from(ActiveRecord::RecordInvalid) }

  it { should rescue_from(ActiveModel::StrictValidationFailed) }

  it { should rescue_from(ActiveRecord::RecordNotFound) }

  # private methods

  describe '#authenticate!' do
    let!(:superuser) { create(:backoffice_superuser) }

    let!(:session) { create(:backoffice_session, superuser: superuser) }

    before { expect(subject).to receive(:authenticate_or_request_with_http_token).and_yield(session.token) }

    specify { expect(subject.send(:authenticate!)).to eq(superuser) }
  end

  describe '#parent' do
    specify { expect { subject.send(:parent) }.to raise_error(NotImplementedError) }
  end

  describe '#resource' do
    specify { expect { subject.send(:resource) }.to raise_error(NotImplementedError) }
  end

  describe '#resource_params' do
    specify { expect { subject.send(:resource_params) }.to raise_error(NotImplementedError) }
  end

  describe '#build_resource' do
    specify { expect { subject.send(:build_resource) }.to raise_error(NotImplementedError) }
  end

  describe '#collection' do
    specify { expect { subject.send(:collection) }.to raise_error(NotImplementedError) }
  end
end
