module Errplane
  class Transmitter
    def initialize(params = {})
    end

    def relay(black_box)
      http = initialize_http_connection
      data = black_box.to_json
      response = begin
                   http.post("/exceptions", data)
                 rescue Exception => e
                   e
                 end

      case response
      when Net::HTTPSuccess
        # Success
      else
        # Failure
      end
    end

    private
    def initialize_http_connection
      connection = Net::HTTP.new(API_HOST, "80")
    end
  end
end
