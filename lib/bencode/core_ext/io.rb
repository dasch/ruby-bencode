class IO
  def self.bdecode(filename)
    File::open(filename, 'rb') {|io| io.bdecode}
  end

  def self.bencode(filename)
    File::open(filename, 'rb') {|io| io.bencode}
  end

  def bdecode
    read.chomp.bdecode
  end

  def bencode
    read.chomp.bencode
  end
end
