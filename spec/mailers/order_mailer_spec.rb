require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  let(:user) { create :user }
  let!(:order) { create(:order, user: user) }
  let(:mail) { described_class.order_confirmation(user).deliver_now }

  it 'renders the subject' do
    expect(mail.subject).to eq('Your order confirmation')
  end

  it 'renders the receiver email' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eq(['francis.vimmer@gmail.com'])
  end

  it 'sends an email' do
    expect{ mail }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
