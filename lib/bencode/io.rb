
class IO
  def self.bdecode(filename)
    open(filename, 'r').bdecode
  end

  def self.bencode(filename)
    open(filename, 'r').bencode
  end

  def bdecode
    read.chomp.bdecode
  end

  def bencode
    read.chomp.bencode
  end
end
