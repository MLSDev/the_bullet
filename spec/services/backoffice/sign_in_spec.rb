# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::SignIn do
  it { should be_a(ActiveModel::Validations) }

  it { should delegate_method(:decorate).to(:session) }

  describe '#initialize' do
    let(:params) { { email: 'me@example.com', password: 'password' } }

    subject { described_class.new(params) }

    its(:email) { should eq('me@example.com') }

    its(:password) { should eq('password') }
  end

  describe '#save!' do
    let!(:superuser) { create(:backoffice_superuser, password: 'password') }

    context 'not valid' do
      let(:params) { { email: superuser.email, password: 'wrong password' } }

      subject { described_class.new(params) }

      specify { expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed) }
    end

    context 'valid' do
      let(:params) { { email: superuser.email, password: 'password' } }

      subject { described_class.new(params) }

      specify { expect { subject.save! }.not_to raise_error }

      specify { expect { subject.save! }.to change { Backoffice::Session.count }.from(0).to(1) }
    end
  end

  # private methods

  describe '#superuser' do
    let!(:superuser) { create(:backoffice_superuser, email: 'igor.zubkov@gmail.com') }

    let(:params) { { email: 'Igor.Zubkov@gmail.com' } }

    subject { described_class.new(params) }

    specify { expect(subject.send(:superuser)).to eq(superuser) }

    specify { expect { subject.send(:superuser) }.to change { subject.instance_variable_get(:@superuser) }.from(nil).to(superuser) }
  end

  describe '#superuser_presence' do
    context 'superuser not found' do
      before { expect(subject).to receive(:superuser).and_return(nil) }

      before { subject.send(:superuser_presence) }

      specify { expect(subject.errors[:base]).to eq(['Email and/or password is invalid']) }
    end

    context 'superuser found' do
      let!(:superuser) { create(:backoffice_superuser) }

      before { expect(subject).to receive(:superuser).and_return(superuser) }

      before { subject.send(:superuser_presence) }

      specify { expect(subject.errors[:base]).to eq([]) }
    end
  end

  describe '#superuser_password' do
    context 'superuser not found' do
      before { expect(subject).to receive(:superuser).and_return(nil) }

      specify { expect(subject.send(:superuser_password)).to eq(nil) }
    end

    context 'superuser found but password is invalid' do
      let!(:superuser) { create(:backoffice_superuser, password: 'password') }

      before { expect(subject).to receive(:superuser).and_return(superuser).twice }

      before { expect(subject).to receive(:password).and_return('wrong password') }

      before { subject.send(:superuser_password) }

      specify { expect(subject.errors[:base]).to eq(['Email and/or password is invalid']) }
    end

    context 'superuser found and password is valid' do
      let(:superuser) { create(:backoffice_superuser, password: 'password') }

      before { expect(subject).to receive(:superuser).and_return(superuser).twice }

      before { expect(subject).to receive(:password).and_return('password') }

      before { subject.send(:superuser_password) }

      specify { expect(subject.errors[:base]).to eq([]) }
    end
  end

  describe '#create_session!' do
    context '@session is set' do
      let!(:session) { create(:backoffice_session) }

      before { subject.instance_variable_set(:@session, session) }

      specify { expect(subject.send(:create_session!)).to eq(session) }
    end

    context '@session not set' do
      let!(:superuser) { create(:backoffice_superuser) }

      let(:params) { { email: 'me@example.com', password: 'password' } }

      subject { described_class.new(params) }

      before { expect(subject).to receive(:superuser).and_return(superuser) }

      specify { expect { subject.send(:create_session!) }.to change { superuser.sessions.count }.from(0).to(1) }
    end
  end
end
