require_relative "require"
require_all_packages

def handle_commands(command, params)
  if Object.const_defined?(command)
    c = Object.const_get(command)
    c.send(:main, params)
  else
    puts "Command \'#{command.downcase}\' not found"
  end
end

loop do
  display_prompt
  raw_input = gets
  handle_commands(:Exit,nil) if raw_input.nil?
  input = raw_input.gsub("\n", "").split(" ")
    if input[0] != ""
      command = input[0].capitalize.to_sym
      params = input[1..input.length]
      handle_commands(command, params)
    end
end
