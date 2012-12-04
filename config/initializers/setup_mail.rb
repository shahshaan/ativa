ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => ENV['PSD_GMAIL_EMAIL'],
  :password             => ENV['PSD_GMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp