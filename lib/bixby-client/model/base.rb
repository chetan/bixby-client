
module Bixby
  module Model
    class Base
      class << self

        def get(url)
          req = HTTPI::Request.new(api_uri(url))
          req.headers["Content-Type"] = "application/json"
          req.headers["Accept"] = "application/json" # temp workaround, manager should always return JSON on REST urls
          Bixby.client.sign_http_request(req)
          res = HTTPI.get(req)
          if res.error? then
            raise "error" # TODO
          end
          MultiJson.load(res.body)
        end

        def api_uri(*args)
          if args.first !~ %r{^/rest/} then
            args.unshift "/rest#{args.shift}"
          end
          URI.join(Bixby.client.manager_uri, *args).to_s
        end

      end # self
    end
  end
end
