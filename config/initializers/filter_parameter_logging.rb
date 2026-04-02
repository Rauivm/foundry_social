Rails.application.config.filter_parameters += [
  :password,
  :password_confirmation,
  :email,
  :token,
  :_key,
  :crypt,
  :salt,
  :certificate,
  :otp_attempt
]
