
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

          data = MultiJson.load(res.body)
          if data.kind_of? Array then
            return data.map{ |d| self.new(d) }
          else
            return self.new(d)
          end
        end

        def api_uri(*args)
          if args.first !~ %r{^/rest/} then
            args.unshift "/rest#{args.shift}"
          end
          URI.join(Bixby.client.manager_uri, *args).to_s
        end

      end # self

      def initialize(hash=nil)
        return if hash.nil?

        hash.each do |k,v|
          instance_variable_set("@#{k}", v)
          next if self.respond_to?(k.to_sym)
          code = <<-EOF
          def #{k}()
            @#{k}
          end
          EOF
          eval(code)
        end

        def [](key)
          if self.respond_to?(key.to_sym) then
            return self.send(key.to_sym)
          end
          return nil
        end

      end

    end
  end
end
