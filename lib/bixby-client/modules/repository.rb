
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


    # Download the given list of files
    #
    # @param [CommandSpec] cmd    CommandSpec representing the Bundle to which the files belong
    # @param [Hash] files         Hash, returned from #list_files
    #
    # @deprecated Use {#list_files} and {#fetch_file} respectively
    def self.download_files(cmd, files)
      return if files.nil? or files.empty?

      local_path = cmd.bundle_dir
      digest = cmd.load_digest
      files.each do |f|

        fetch = true
        if not digest then
          fetch = true
        elsif df = digest["files"].find{ |h| h["file"] == f["file"] } then
          # compare digest w/ stored one if we have it
          fetch = (df["digest"] != f["digest"])
        else
          fetch = true
        end

        if not fetch then
          debug { "skipping: #{f}" }
          next
        end

        debug { "fetching: #{f}"}

        params = cmd.to_hash
        params.delete(:digest)

        filename = File.join(local_path, f['file'])
        path = File.dirname(filename)
        if not File.exist? path then
          FileUtils.mkdir_p(path)
        end

        req = JsonRequest.new("provisioning:fetch_file", [ params, f['file'] ])
        Bixby.client.exec_api_download(req, filename)
        if f['file'] =~ /^bin/ then
          # correct permissions for executables
          FileUtils.chmod(0755, filename)
        end
      end # files.each

      cmd.update_digest
    end


  end
end
