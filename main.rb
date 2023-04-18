require 'date'
require './app'

def main
  app = App.new

  loop do
    app.display_menu
    option = gets.chomp.to_i
    break if app.process_option(option, app)
  end
end

main
