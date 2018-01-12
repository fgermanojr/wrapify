require "wrapify/version"

class String

  # Wrap string to given wraplimit.
  #
  # @param decimal wraplimit
  # @return [String]
  #
  # @example

  # doc1 = <<-DOC1HERE
  # line 1 contains a lot of         stuff
  # line 2 contains even more, which    we will wrap to a fixed short
  # line 3 boundry if we are lucky. Who knows    what will really     happen.
  # line 4
  # DOC1HERE

  # doc1.wrap_to_limit(20) === doc1_wrapped

  # doc1_ wrapped = <<-RESULT
  # line 1 contains a 
  # lot of stuff line 
  # 2 contains even 
  # more, which we 
  # will wrap to a 
  # fixed short line 3 
  # boundry if we are 
  # lucky. Who knows 
  # what will really 
  # happen. line 4
  # RESULT

  def wrap_to_limit(wrap_limit)
    str = self.gsub(/\s+/, ' ') # convert runs of white space to single space
    String.wrap_process(str, wrap_limit)
  end

  private

  def self.wrap_process(str, wrap_limit)
    # Wrap units into line not to exceed wrap_limit of line
    # In case where next_up is longer than wrap we include with overlength.
    # Could add option, :force, 'xxxyy\n'.wrap_to_limit(4) = 'xxxy\ny\n'
    # Thnik about.

    str_array = str.split(' ')
    run_index = 0
    result = ''
    line = ''

    until str_array.empty? do
      next_up = str_array.shift
      # puts "next_up=#{next_up}"
      if (line.length + next_up.length + 1 < wrap_limit)
        # got room add it in
        line += next_up + ' '
        run_index += 1
      else
        line = next_up if line.empty? # edge case, test 4
        # start new line
        result += line + "\n" unless str_array.empty? # edge case, test 2
        # puts 'reset'
        line = next_up + ' '
        run_index += 1
      end
    end

    result += line.strip + "\n" if line.length > 0 # Don't lose what is left
    result
  end

end
