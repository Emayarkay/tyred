require 'open-uri'
require 'net/https'

module Net
  class HTTP
    class_eval do
      alias_method :original_use_ssl=, :use_ssl=

      def use_ssl=(flag)
        self.ca_path = Rails.root.join('/usr/lib/ssl/certs/ca-certificates.crt').to_s
        self.verify_mode = OpenSSL::SSL::VERIFY_PEER
        self.original_use_ssl = flag
      end
    end
  end
end