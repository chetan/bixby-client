
module Bixby
  module Script
    module Platform

      def uname
        RUBY_PLATFORM
      end

      def osx?
        uname =~ /darwin/
      end
      alias_method :darwin?, :osx?
      alias_method :mac?, :osx?

      def linux?
        uname =~ /linux/
      end

      def solaris?
        uname =~ /solaris/
      end

      def windows?
        uname =~ /mswin|mingw|bccwin|wince|cygwin/
      end
      alias_method :win?, :windows?

      def bsd?
        uname =~ /freebsd|netbsd|openbsd/
      end

      # architectures

      def amd64?
        RbConfig::CONFIG['target_cpu'] == "x86_64"
      end

      def x86?
        RbConfig::CONFIG['target_cpu'] =~ /i[3-6]86/
      end

    end
  end
end
