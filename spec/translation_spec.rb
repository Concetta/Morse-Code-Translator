# frozen_string_literal: true
require 'spec_helper'

describe 'translation' do
  context 'morse_code_conversion' do
    it 'turns the letter into morse code' do
      translation = Translation.new('H')
      expect(translation.morse_code_conversion).to eq('....')
    end

    it 'turns the message into morse code adding | to each letter' do
      translation = Translation.new('Hello')
      expect(translation.morse_code_conversion).to eq('....|.|.-..|.-..|---')
    end

    it 'turns the message into morse code adding | to each letter including a .' do
      translation = Translation.new('Hello.')
      expect(translation.morse_code_conversion).to eq('....|.|.-..|.-..|---|.-.-.-')
    end

    it 'turns the message into morse code adding | to each letter including a ,' do
      translation = Translation.new('Hello,')
      expect(translation.morse_code_conversion).to eq('....|.|.-..|.-..|---|--..--')
    end

    it 'turns the message into morse code adding | to each letter including a 1' do
      translation = Translation.new('Hello1')
      expect(translation.morse_code_conversion).to eq('....|.|.-..|.-..|---|.----')
    end

    it 'turns the two words into morse code adding | to each letter and seperating sentances with a /' do
      translation = Translation.new('I am')
      expect(translation.morse_code_conversion).to eq('../.-|--')
    end

    it 'turns the sentance into morse code adding | to each letter and seperating sentances with a /' do
      translation = Translation.new('I am in trouble')
      expect(translation.morse_code_conversion).to eq('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.')
    end
  end

  context 'obfuscate_morse_code_conversion' do
    it 'turns the morse code of one letter into obfuscate with all the same symbols' do
      translation = Translation.new('H')
      expect(translation.obfuscate_morse_code_conversion).to eq('4')
    end

    it 'turns the morse code of two letters into obfuscate with all the same symbols' do
      translation = Translation.new('Hh')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|4')
    end

    it 'turns the morse code of one letter into obfuscate with different symbols in order' do
      translation = Translation.new('u')
      expect(translation.obfuscate_morse_code_conversion).to eq('2A')
    end

    it 'turns the morse code of two letters into obfuscate with the same symbols' do
      translation = Translation.new('He')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|1')
    end

    it 'turns the morse code of two letters into obfuscate with the different symbols' do
      translation = Translation.new('Hu')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|2A')
    end

    it 'turns the morse code of one letter into obfuscate with different symbols in different order' do
      translation = Translation.new('R')
      expect(translation.obfuscate_morse_code_conversion).to eq('1A1')
    end

    it 'turns the morse code of one letter into obfuscate with different symbols in different order' do
      translation = Translation.new('C')
      expect(translation.obfuscate_morse_code_conversion).to eq('A1A1')
    end

    it 'turns the morse code of two letters with a . into obfuscate with different symbols' do
      translation = Translation.new('Hu.')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|2A|1A1A1A')
    end

    it 'turns the morse code of two letters with a , into obfuscate with different symbols' do
      translation = Translation.new('Hu,')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|2A|B2B')
    end

    it 'turns the morse code of two letters with a 9 into obfuscate with different symbols' do
      translation = Translation.new('Hu9')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|2A|D1')
    end

    it 'turns the morse code of 5 letters into obfuscate with different symbols in different order' do
      translation = Translation.new('Hello')
      expect(translation.obfuscate_morse_code_conversion).to eq('4|1|1A2|1A2|C')
    end

    it 'turns the morse code of a sentance into obfuscate with / after each word' do
      translation = Translation.new('I am in trouble')
      expect(translation.obfuscate_morse_code_conversion).to eq('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1')
    end
  end
end
