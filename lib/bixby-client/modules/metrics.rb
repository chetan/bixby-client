
module Bixby
  module Metrics

    # Store the results of one or more Checks. Each result may contain multiple metrics.
    #
    # Fires the :put_check_result hook on completion, passing results as the only param.
    #
    # @param [Array<Hash>] results              An array of results from one or more checks
    # @option results [Fixnum] :check_id
    # @option results [String] :key             base key name
    # @option results [String] :status          OK, WARNING, CRITICAL, UNKNOWN, TIMEOUT
    # @option results [Fixnum] :timestamp
    # @option results [Array]  :metrics
    #   * [Hash] :metrics                       key/value pairs
    #   * [Hash] :metadata                      key/value pairs
    # @option results [Array<String>] :errors   list of errors, if any
    #
    # @return [void]
    #
    # Example input:
    #
    #    {
    #      "status"    => "OK",
    #      "timestamp" => 1329775841,
    #      "key"       => "hardware.storage.disk",
    #      "check_id"  => "77",
    #      "metrics" => [
    #        {
    #          "metrics"  => { "size"=>297, "used"=>202, "free"=>94, "usage"=>69 },
    #          "metadata" => { "mount"=>"/", "type"=>"hfs" }
    #        }
    #      ],
    #      "errors"=>[]
    #    }
    #
    def self.put_check_results(results)
      req = JsonRequest.new("metrics:put_check_result", [ reports ])
      return Bixby.client.exec_api(req)
    end

  end # Metrics
end # Bixby
