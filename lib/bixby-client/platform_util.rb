
module Bixby
module PlatformUtil

  def uname
    RUBY_PLATFORM
  end

  def osx?
    uname =~ /darwin/
  end
  alias :darwin? :osx?
  alias :mac? :osx?

  def linux?
    uname =~ /linux/
  end

  def solaris?
    uname =~ /solaris/
  end

  def win?
    uname =~ /mswin|mingw|bccwin|wince|cygwin/
  end
  alias :windows? :win?

  def bsd?
    uname =~ /freebsd|netbsd|openbsd/
  end

end # PlatformUtil
end # Bixby
