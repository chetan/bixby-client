
module Bixby
class Command

  include Bixby::Log
  include Bixby::ScriptUtil

  def initialize()
  end

  # retrieve all loaded subclasses of this class
  #
  # @return [Array<Class>] List of subclasses
  def self.subclasses
    @subclasses
  end

  private

  def self.inherited(subclass)
    if superclass.respond_to? :inherited
      superclass.inherited(subclass)
    end
    @subclasses ||= []
    @subclasses << subclass
  end

end # Command
end # Bixby

