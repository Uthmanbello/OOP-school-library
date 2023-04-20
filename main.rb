require 'date'
require './app'

def main
  app = App.new
  menu = Menu.new

  loop do
    menu.display_menu
    option = gets.chomp.to_i
    app.preseve_data
    break if menu.process_option(option, app)
  end
end

main
