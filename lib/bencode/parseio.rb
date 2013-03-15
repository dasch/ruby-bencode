module BEncode
  module ParseIO
    def peek
      c = self.getc
      self.ungetc(c)
      c
    end
  end
end
