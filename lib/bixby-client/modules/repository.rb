
require "fileutils"

module Bixby
  module Repository

    extend Bixby::Log

    # Retrieve a file listing for the given Bundle
    #
    # @param [CommandSpec] cmd      CommandSpec representing the Bundle to list
    #
    # @return [Array<Hash>]
    #   * file [String] Relative path of file
    #   * digest [String] SHA256 digest of file
    def self.list_files(cmd)
      debug { "listing files for bundle: #{cmd.bundle}"}
      req = JsonRequest.new("provisioning:list_files", cmd.to_hash)
      res = Bixby.client.exec_api(req)
      return res.data
    end

    # Download the given command file
    #
    # @param [CommandSpec] cmd    CommandSpec representing the Bundle to which the files belong
    # @param [Hash] files         Hash, returned from #list_files
    def self.fetch_file(cmd, file, dest)
      params = cmd.to_hash
      params.delete(:digest)
      req = JsonRequest.new("provisioning:fetch_file", [params, file])
      Bixby.client.exec_api_download(req, dest)
    end


  end
end
