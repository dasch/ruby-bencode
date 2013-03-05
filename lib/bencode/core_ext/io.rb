require 'stringio'

module ParseIO
  def peek
    c = self.getc
    self.ungetc(c)
    c
  end
end

class IO
  include ParseIO
  
  def self.bdecode(filename)
    open(filename, 'rb') {|io| io.bdecode}
  end

  def self.bencode(filename)
    open(filename, 'rb') {|io| io.bencode}
  end

  def bdecode
    read.chomp.bdecode
  end

  def bencode
    read.chomp.bencode
  end  
end

class StringIO
  include ParseIO
end