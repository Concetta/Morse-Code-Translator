# frozen_string_literal: true
require './models/translation.rb'

arg = ARGV[0]
message = Translation.new(arg)
obfuscate_code = message.obfuscate_morse_code_conversion
morse_code = message.morse_code_conversion

puts "Morse Code: #{morse_code}"
puts "Obfuscated Morse Code: #{obfuscate_code}"

# https://gist.github.com/kmckelvin/41a4a69e397b510274373aa241698561
