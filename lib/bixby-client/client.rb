
require "curb"
require "httpi"
require "api-auth"

module Bixby

  # Implements the Bixby client API
  class Client

    include Bixby::Log

    # Create a new Client
    #
    # @param [String] access_key
    # @param [String] secret_key
    def initialize(access_key, secret_key)
      @access_key = access_key
      @secret_key = secret_key
    end

    # Execute the given API request on the manager
    #
    # @param [String] operation  Name of operation
    # @param [Array] params  Array of parameters; must ve valid JSON types
    #
    # @return [JsonResponse]
    def exec(op, params)
      exec_api(JsonRequest.new(op, params))
    end

    # Execute the given API download request
    #
    # @param [String] download_path     Absolute filename to download requested file to
    # @param [String] operation  Name of operation
    # @param [Array] params  Array of parameters; must ve valid JSON types
    #
    # @return [JsonResponse]
    def exec_download(download_path, op, params)
      exec_api_download(JsonRequest.new(op, params), download_path)
    end

    # Execute the given API request on the manager
    #
    # @param [JsonRequest] json_req
    # @return [JsonResponse]
    def exec_api(json_req)
      begin
        req = sign_request(json_req)
        res = HTTPI.post(req).body
        return JsonResponse.from_json(res)
      rescue Curl::Err::CurlError => ex
        return JsonResponse.new("fail", ex.message)
      end
    end

    # Execute the given API download request
    #
    # @param [JsonRequest] json_req     Request to download a file
    # @param [String] download_path     Absolute filename to download requested file to
    # @return [JsonResponse]
    def exec_api_download(json_req, download_path)
      begin
        req = sign_request(json_req)
        File.open(download_path, "w") do |io|
          req.on_body { |d| io << d; d.length }
          HTTPI.post(req)
        end
        return JsonResponse.new("success")
      rescue Curl::Err::CurlError => ex
        return JsonResponse.new("fail", ex.message)
      end
    end


    private

    # Create a signed request
    #
    # @param [JsonRequest] json_req
    #
    # @return [HTTPI::Request]
    def sign_request(json_req)
      post = json_req.to_json
      req = HTTPI::Request.new(:url => api_uri, :body => post)
      req.headers["Content-Type"] = "application/json"

      if crypto_enabled? and not @secret_key.nil? then
        ApiAuth.sign!(req, @access_key, @secret_key)
      end

      return req
    end

    def api_uri
      URI.join(Bixby.manager_uri, "/api").to_s
    end

    def crypto_enabled?
      b = ENV["BIXBY_NOCRYPTO"]
      !(b and %w{1 true yes}.include? b)
    end

  end # Client

end # Bixby
