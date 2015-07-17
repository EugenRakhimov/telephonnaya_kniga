require_relative "./t-k_controller.rb"

input = ARGV
command = ARGV.shift
filepath = ARGV.shift

telephonnaya_controller = TelephonnayaController.new(filepath)

case command
  when "open" then telephonnaya_controller.open
  else telephonnaya_controller.open
end
