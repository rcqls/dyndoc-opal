class DyndocStringScanner
  
  def initialize(string)
    @string  = string
    _reset_state
  end

  def [](idx)
    %x{
      var match = #@match;

      if (idx < 0) {
        idx += match.length;
      }

      if (idx < 0 || idx >= match.length) {
        return nil;
      }

      if (match[idx] == null) {
        return nil;
      }

      return match[idx];
    }
  end

  def bol?
    `#@pos === 0 || #@string.charAt(#@pos - 1) === "\n"`
  end

  def check(pattern)
    _scan pattern, false, true, true
  end

  # def check(regex)
  #   %x{
  #     var regexp = new RegExp('^' + regex.toString().substring(1, regex.toString().length - 1)),
  #         result = regexp.exec(#@working);

  #     if (result == null) {
  #       return #{self}.matched = nil;
  #     }

  #     return #{self}.matched = result[0];
  #   }
  # end

  def check_until(pattern)
    _scan pattern, false, true, false
  end

  def concat(str)
    @string << str
    self
  end

  alias :<<  :concat

  def eos?
    `#@working.length === 0`
  end

  def exist?(pattern)
    _scan pattern, false, false, false
  end

  def get_byte()
    %x{
      var result = nil;
      if (#{self}.pos < #{self}.string.length) {
        self.prev_pos = self.pos;
        #{self}.pos += 1;
        result = #{self}.matched = #{self}.working.substring(0, 1);
        #{self}.working = #{self}.working.substring(1);
      }
      else {
        #{self}.matched = nil;
      }

      return result;
    }
  end

  # ruby-sl version => to try
  # def get_byte
  #   scan(/./mn)
  # end

  # not exactly, but for now...
  alias getch get_byte

  def getch
    scan(/./m)
  end

  def inspect
    if defined? @string
      if eos?
        str = "#<StringScanner fin>"
      else
        if string.length - pos > 5
          rest = "#{string[pos..pos+4]}..."
        else
          rest = string[pos..string.length]
        end

        if pos > 0
          if pos > 5
            prev = "...#{string[pos-5...pos]}"
          else
            prev = string[0...pos]
          end

          str = "#<StringScanner #{pos}/#{string.length} #{prev.inspect} @ #{rest.inspect}>"
        else
          str = "#<StringScanner #{pos}/#{string.length} @ #{rest.inspect}>"
        end
      end

      #str.taint if @string.tainted?
      return str
    else
      "#<StringScanner (uninitialized)>"
    end
  end

  def match?(pattern)
    _scan pattern, false, false, true
  end

  attr_reader :match
  attr_reader :matched

  def matched?
    !!@matched
  end

  def matched_size
    #@matched.bytesize
    `#@matched.length`
  end

  def peek(length)
    `#@working.substring(0, length)`
  end

  attr_reader :pos

  def pos=(pos)
    %x{
      if (pos < 0) {
        pos += #{@string.length};
      }
    }

    @pos = pos
    @working = `#{@string}.slice(pos)`
  end

  def post_match
    `#@string.substring(#@prev_pos+#@match['index']+#@matched.length)` if matched?
  end

  def pre_match
    `#@string.substring(0, #@prev_pos + #@match['index'])` if matched?
  end

  def reset
    _reset_state
    self
  end

  def rest
    @working
  end

  def rest?
    return !eos?
  end

  def rest_size
    @string.bytesize - @pos
  end

  def scan(pattern)
    _scan pattern, true, true, true
  end

  def scan_until(pattern)
    _scan pattern, true, true, false
  end

  def scan_full(pattern, advance_pos, getstr)
    _scan pattern, advance_pos, getstr, true
  end

  def search_full(pattern, advance_pos, getstr)
    _scan pattern, advance_pos, getstr, false
  end

  def skip(pattern)
    _scan pattern, true, false, true
  end

  # def skip(re)
  #   %x{
  #     re = new RegExp('^' + re.source)
  #     var result = re.exec(#@working);

  #     if (result == null) {
  #       return #{self}.matched = nil;
  #     }
  #     else {
  #       var match_str = result[0];
  #       var match_len = match_str.length;
  #       #{self}.matched = match_str;
  #       self.prev_pos = self.pos;
  #       #{self}.pos += match_len;
  #       #{self}.working = #{self}.working.substring(match_len);
  #       return match_len;
  #     }
  #   }
  # end


  def skip_until(pattern)
    _scan pattern, true, false, false
  end

  attr_reader :string

  def string=(string)
    @string = string
    _reset_state
  end

  def terminate
    @match = nil
    @pos = @string.length
  end

  def unscan
    @pos = @prev_pos
    @prev_pos = nil
    @match = nil
    self
  end

  def _reset_state
    @prev_pos = @pos = 0
    @matched = nil
    @working = @string
    @match = []
  end

  def _scan(regex,advance_pos,getstr,headonly)
    %x{
      var result;
      if (#{headonly}) {
        var regex = new RegExp('^' + regex.source); //new RegExp('^' + regex.toString().substring(1, regex.toString().length - 1));
        result = regex.exec(#@working);
      } else {
        result = regex.exec(#@working);
      }

      if (result == null) {
        return #@matched = nil;
      }
      else {
        var width = result['index'] + result[0].length;
        #@prev_pos = #@pos;
        if(#{advance_pos}) {
          #@pos += width;
          #@working  = #@working.substring(width);
        }
        #@matched  = result[0];
        #@match    = result;
          
        if(!#{getstr}) {
          return width;
        }
        return #@matched;
      }
    }
  end

end
