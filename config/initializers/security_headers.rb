Rails.application.config.action_dispatch.default_headers = {
  "X-Frame-Options" => "DENY",
  "X-Content-Type-Options" => "nosniff",
  "X-XSS-Protection" => "0",
  "Referrer-Policy" => "strict-origin-when-cross-origin",
  "Strict-Transport-Security" => "max-age=31536000; includeSubDomains"
}
