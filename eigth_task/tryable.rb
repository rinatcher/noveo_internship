module Tryable
  def try(&block)
    block.call(self)
    rescue NoMethodError
    nil
  end
end
Object.include(Tryable)
