
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

    # Download athe given list of files
    #
    # @param [CommandSpec] cmd    CommandSpec representing the Bundle to which the files belong
    # @param [Hash] files         Hash, returned from #list_files
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

        next if not fetch

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
