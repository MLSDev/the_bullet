# frozen_string_literal: true

require 'rails_helper'

describe Api::SetNewPassword, type: :model do
  it { should be_a(ActiveModel::Validations) }

  it { should delegate_method(:decorate).to(:session) }

  it { should validate_confirmation_of(:password) }

  it { should validate_presence_of(:password_confirmation) }

  describe '#initialize' do
    let(:params) do
      {
        reset_token: 'token123',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    subject { described_class.new(params) }

    its(:reset_token) { should eq('token123') }

    its(:password) { should eq('password') }

    its(:password_confirmation) { should eq('password') }
  end

  describe '#save!' do
    context 'valid' do
      let!(:user) { create(:user, reset_token: 'token123') }

      let!(:session) { create(:session, user: user) }

      let(:params) do
        {
          reset_token: 'token123',
          password: 'new password',
          password_confirmation: 'new password'
        }
      end

      subject { described_class.new(params) }

      # TODO: user.sessions.destroy_all
      # TODO: create_session!

      specify { expect { subject.save! }.not_to raise_error }
    end

    context 'not valid' do
      let!(:user) { create(:user, reset_token: 'token123') }

      let(:params) { { reset_token: 'wrong token' } }

      subject { described_class.new(params) }

      specify { expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed) }
    end
  end

  # private methods

  describe '#user' do
    let!(:user) { create(:user, reset_token: 'token123') }

    let(:params) { { reset_token: 'token123' } }

    subject { described_class.new(params) }

    specify { expect(subject.send(:user)).to eq(user) }

    specify { expect { subject.send(:user) }.to change { subject.instance_variable_get(:@user) }.from(nil).to(user) }
  end

  describe '#user_presence' do
    context 'user not found' do
      before { expect(subject).to receive(:user).and_return(nil) }

      before { subject.send(:user_presence) }

      specify { expect(subject.errors[:user]).to eq(['not found']) }
    end

    context 'user found' do
      let!(:user) { create(:user) }

      before { expect(subject).to receive(:user).and_return(user) }

      before { subject.send(:user_presence) }

      specify { expect(subject.errors[:user]).to eq([]) }
    end
  end

  describe '#create_session!' do
    context '@session is set' do
      let!(:session) { create(:session) }

      before { subject.instance_variable_set(:@session, session) }

      specify { expect(subject.send(:create_session!)).to eq(session) }
    end

    context '@session not set' do
      let!(:user) { create(:user) }

      before { expect(subject).to receive(:user).and_return(user) }

      specify { expect { subject.send(:create_session!) }.to change { user.sessions.count }.from(0).to(1) }
    end
  end
end
