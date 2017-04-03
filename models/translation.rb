class Translation
  INTERNATIONAL_MORSE_CODE = {
    'A' => '.-',
    'B' => '-...',
    'C' => '-.-.',
    'D' => '-..',
    'E' => '.',
    'F' => '..-.',
    'G' => '--.',
    'H' => '....',
    'I' => '..',
    'J' => '.---',
    'K' => '-.-',
    'L' => '.-..',
    'M' => '--',
    'N' => '-.',
    'O' => '---',
    'P' => '.--.',
    'Q' => '--.-',
    'R' => '.-.',
    'S' => '...',
    'T' => '-',
    'U' => '..-',
    'V' => '...-',
    'W' => '.--',
    'X' => '-..-',
    'Y' => '-.--',
    'Z' => '--..',
    '0' => '-----',
    '1' => '.----',
    '2' => '..---',
    '3' => '...--',
    '4' => '....-',
    '5' => '.....',
    '6' => '-....',
    '7' => '--...',
    '8' => '---..',
    '9' => '----.',
    '.' => '.-.-.-',
    ',' => '--..--'
  }.freeze

  DASH_COUNT = {
    1 => 'A',
    2 => 'B',
    3 => 'C',
    4 => 'D',
    5 => 'E'
  }.freeze

  def initialize(message)
    @message = message
  end

  def morse_code_conversion
    message = @message.upcase
    letters = message.split('')
    letter_split = []
    letters.each_with_index do |letter, n|
      next_letter = letters[n + 1]
      letter_split << if letter == ' '
                        '/'
                      else
                        morse_code(letter)
                      end
      add_pipe(letter, next_letter, letter_split)
    end
    letter_split.join('')
  end

  def obfuscate_morse_code_conversion
    codes = morse_code_conversion.split('|')
    result = []
    codes.each_with_index do |code, n|
      next_code = codes[n + 1]
      until code.empty?
        if code[0] == '.'
          count_dots = code.split('-')
          remove_slashs = count_dots[0].split('/')
          x =  count_dots[0].length
          code = code[x.to_i..-1]
          if count_dots[0].split('').last == '/'
            result << remove_slashs[0].count('.').to_s + '/'.to_s
          elsif remove_slashs.count == 2
            result << remove_slashs[0].count('.').to_s +
                      '/'.to_s +
                      remove_slashs[1].count('.').to_s
          else
            result << x
          end
        else
          count_dashes = code.split('.')
          remove_slashs = count_dashes[0].split('/')
          x =  count_dashes[0].length
          code = code[x.to_i..-1]
          if count_dashes[0].split('').last == '/'
            result << dash_count(remove_slashs[0].count('-')).to_s +
                      '/'.to_s
          elsif remove_slashs.count == 2
            result << dash_count(remove_slashs[0].count('-')).to_s +
                      '/'.to_s +
                      dash_count(remove_slashs[1].count('-')).to_s
          else
            result << dash_count(x.to_i)
          end
        end
      end
      result << '|' unless next_code.nil?
    end
    result.join('')
  end

  def add_pipe(item, next_item, item_split)
    item_split << '|' if item != ' ' && next_item != ' ' && !next_item.nil?
  end

  def dash_count(code)
    DASH_COUNT[code]
  end

  def morse_code(letter)
    INTERNATIONAL_MORSE_CODE[letter]
  end
end
