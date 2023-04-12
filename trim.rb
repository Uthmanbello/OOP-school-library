require "./decorator.rb"

class TrimmerDecorator < Decorator
  def correct_name
    "#{@nameable.correct_name}.truncate(10)"
  end
end