
module Bixby
  module Repository

    # Retrieve a file listing for the given Bundle
    #
    # @param [CommandSpec] cmd      CommandSpec representing the Bundle to list
    #
    # @return [Array<Hash>]
    #   * file [String] Relative path of file
    #   * digest [String] SHA256 digest of file
    def self.list_files(cmd)
      req = JsonRequest.new("provisioning:list_files", cmd.to_hash)
      res = Bixby.client.exec_api(req)
      return res.data
    end

  end
end
