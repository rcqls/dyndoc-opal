if RUBY_ENGINE == "opal"
  require 'opal' 
  require 'encoding' # needed for String.bytes method

  ## Careful, String in Opal are immutable
  ## <<, or any method ended by ! do not exist.
  class String
    # normally javascript is encding friendly
    alias bytesize length

    # split in opal seems too complicated!
    def split(pattern = $; || ' ', limit = undefined)
      `#{self}.split(pattern,limit)`
    end

    alias byteslice slice

  end
 
  # redefinition of StringScanner in js
  # complete path required
  require '/Users/remy/Github/dyndoc-opal/src/strscan_dyndoc.rb'
else
  require 'strscan'
  DyndocStringScanner=StringScanner
end

require '/Users/remy/Github/dyndoc-opal/src/scanner.rb'

# pos,[], string=, pre_match, matched, exist?
#  scan, scan_until , check_until
