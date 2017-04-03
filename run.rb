# frozen_string_literal: true
require './models/translation.rb'

arg = ARGV[0]
message = Translation.new(arg)
code = message.obfuscate_morse_code_conversion

if File.file?(code)
  File.read(code)
else
  puts code
end
