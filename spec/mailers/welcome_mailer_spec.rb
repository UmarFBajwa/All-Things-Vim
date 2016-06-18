require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  let(:user) { create :user }
  let(:mail) { described_class.welcome_email(user).deliver_now }

  it 'renders the subject' do
    expect(mail.subject).to eq('Welcome to the Vim Shop')
  end

  it 'renders the receiver email' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eq(['francis.vimmer@gmail.com'])
  end

  it 'assigns @name' do
    expect(mail.body.encoded).to match(user.name)
  end

  it 'sends an email' do
    expect{ mail }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
