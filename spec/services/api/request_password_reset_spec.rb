require 'rails_helper'

describe Api::RequestPasswordReset do
  it { should be_a(ActiveModel::Validations) }

  describe '#initialize' do
    let(:params) { { email: 'me@example.com' } }

    subject { described_class.new(params) }

    its(:email) { should eq('me@example.com') }
  end

  describe '#save!' do
    context 'not valid' do
      let(:params) { { email: 'not-found@example.com' } }

      subject { described_class.new(params) }

      specify { expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed) }
    end

    context 'valid' do
      let!(:user) { create(:user) }

      let(:params) { { email: user.email } }

      subject { described_class.new(params) }

      specify { expect { subject.save! }.not_to raise_error }

      # TODO: specify { expect { subject.save! }.to change { user.reset_token } } #.from(0).to(1) }
    end
  end

  # private methods

  describe '#user' do
    let!(:user) { create(:user, email: 'igor.zubkov@gmail.com') }

    let(:params) { { email: 'Igor.Zubkov@gmail.com' } }

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
end
