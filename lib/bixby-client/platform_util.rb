
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

  def win?

  end
  alias :windows? :win?

end # PlatformUtil
end # Bixby
