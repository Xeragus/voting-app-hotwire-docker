# config/initializers/web_console.rb
if Rails.env.development?
    # Allow web-console access from the Docker network.
    # The 192.168.0.0/16 range covers the IP from your logs (192.168.65.1).
    Rails.application.config.web_console.permissions = [
      '127.0.0.1',
      '::1',
      '172.16.0.0/12',
      '192.168.0.0/16'
    ]
end
