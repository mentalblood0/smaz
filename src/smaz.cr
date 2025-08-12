require "./LibSmaz.cr"

module Smaz
  class Exception < Exception
  end

  class Api
    def self.compress(input : String) : Bytes?
      r = Bytes.new input.size
      w = LibSmaz.compress input.to_unsafe, input.size, r.to_unsafe, r.size
      return nil if w == r.size + 1
      raise Exception.new "smaz_compress(#{input.to_unsafe}, #{input.size}, #{r.to_unsafe}, #{r.size}) returned #{w}" if w > r.size
      w > 0 ? r[..w - 1] : "".to_slice
    end

    def self.decompress(input : Bytes) : String
      return "" if input.empty?
      os = input.size * 8
      loop do
        r = Bytes.new os
        w = LibSmaz.decompress input.to_unsafe, input.bytesize, r.to_unsafe, r.size
        if w > r.size
          os *= 2
          next
        end
        return String.new r[..w - 1]
      end
    end
  end
end
