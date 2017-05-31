require 'rails_helper'

describe ResetPasswordMailer do
  describe '#email' do
    let(:user) { create(:user) }

    let(:mail) { described_class.email(user.id) }

    specify { expect(mail.subject).to eq('Reset password mail') }

    specify { expect(mail.to).to eq([user.email]) }

    specify { expect(mail.from).to eq(['from@example.com']) }

    specify { expect(mail.body.encoded).to include(user.reset_token) }
  end
end
