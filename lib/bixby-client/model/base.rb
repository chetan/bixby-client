
module Bixby
  module Model
    class Base

      class << self


        # Public API methods

        def list(*args)
          raise NotImplementedError
        end

        def find(id)
          raise NotImplementedError
        end

        def update(id, data)
          raise NotImplementedError
        end

        def destroy(id)
          raise NotImplementedError
        end



        private

        # Get the object at the given URL
        #
        # @param [String] url
        #
        # @return [Object] single object or an array of objects
        def get(url)
          req = create_req(url)
          Bixby.client.sign_http_request(req)
          res = HTTPI.get(req)
          if res.error? then
            raise "error" # TODO
          end

          data = MultiJson.load(res.body)
          if data.kind_of? Array then
            return data.map{ |d| self.new(d) }
          else
            return self.new(data)
          end
        end

        # Put some data at the given URL (update an object)
        #
        # @param [String] url
        # @param [Hash] data          to update
        #
        # @return [Boolean]
        def put(url, data)
          req = create_req(url)
          req.body = MultiJson.dump(data)
          Bixby.client.sign_http_request(req)
          res = HTTPI.put(req)
          if res.error? then
            raise "error" # TODO
          end
          true
        end
        alias_method :patch, :put

        # Delete the resource at the given URL
        #
        # @param [String] url
        #
        # @return [Boolean]
        def delete(url)
          req = create_req(url)
          Bixby.client.sign_http_request(req)
          res = HTTPI.delete(req)
          if res.error? then
            raise "error" # TODO
          end
          puts res.body
          true
        end

        # Create a fully qualified API URL
        #
        # @param [String] path        or a list of paths
        #
        # @return [String] API URL
        def api_uri(*args)
          if args.first !~ %r{^/rest/} then
            args.unshift File.join("/rest", args.shift) # prepend /rest
          end
          URI.join(Bixby.client.manager_uri, *args).to_s
        end

        # Create a REST request
        #
        # @param [String] url
        #
        # @return [HTTPI::Request]
        def create_req(url)
          req = HTTPI::Request.new(api_uri(url))
          req.headers["Content-Type"] = "application/json"
          req.headers["Accept"] = "application/json" # temp workaround, manager should always return JSON on REST urls
          req
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
