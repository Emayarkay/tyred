require 'open-uri'
require 'net/https'

if Rails.env == 'production'
  module Net
    class HTTP
      class_eval do
        alias_method :original_use_ssl=, :use_ssl=

        def use_ssl=(flag)
          self.ca_file = Rails.root.join('/usr/lib/ssl/certs/ca-certificates.crt').to_s
          self.verify_mode = OpenSSL::SSL::VERIFY_PEER
          self.original_use_ssl = flag
        end
      end
    end
  end
end