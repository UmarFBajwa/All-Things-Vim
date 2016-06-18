require 'rails_helper'

RSpec.describe SendEmailJob, type: :job do
  include ActiveJob::TestHelper

  let(:user) { create :user }

  it 'queues the job' do
    expect {
      described_class.perform_later(user)
    }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is the default queue' do
    expect(SendEmailJob.new.queue_name).to eq 'default'
  end

  it 'executes perform' do
    job = double('job')
    allow(WelcomeMailer).to receive(:welcome_email).with(user).and_return(job)
    allow(job).to receive(:deliver_later)

    expect(WelcomeMailer).to receive(:welcome_email).with(user)

    perform_enqueued_jobs { described_class.perform_later(user)}
  end
end
