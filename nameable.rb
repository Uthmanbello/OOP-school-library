class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    "#{@nameable.correct_name}.capitalize()"
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    "#{@nameable.correct_name}.truncate(10)"
  end
end
