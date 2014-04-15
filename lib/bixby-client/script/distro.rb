
module Bixby
  module Script
    module Distro

      def etc_issue
        return @_etc_issue if @_etc_issue
        @_etc_issue = if linux? then
          File.read("/etc/issue").strip
        else
          nil
        end
      end

      def ubuntu?
        etc_issue =~ /Ubuntu/
      end

      def ubuntu_version
        # e.g., Ubuntu 13.04
        etc_issue =~ /Ubuntu (\d+\.\d+(\.\d+)?)/
        SemVer.parse($1)
      end

      def centos?
        etc_issue =~ /CentOS/
      end
      alias_method :cent?, :centos?

      def centos_version
        # e.g., CentOS release 5.10
        etc_issue =~ /CentOS release (\d+\.\d+)/
        SemVer.parse($1)
      end

      def amazon_linux?
        etc_issue =~ /^Amazon Linux/
      end
      alias_method :amazon?, :amazon_linux?
      alias_method :amazonlinux?, :amazon_linux?

      def amazon_linux_version
        # e.g., Amazon Linux AMI 2013.09
        etc_issue =~ /^Amazon Linux AMI (\d+\.\d+)/
        SemVer.parse($1)
      end

    end
  end
end
