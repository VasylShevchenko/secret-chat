class EmailVerificationWorker
  # include Sidekiq::Worker

  def perform(id)
    # user = User.find(id)
    # EmailVerificationMailer.send_verification(user).deliver_now
  end
end
