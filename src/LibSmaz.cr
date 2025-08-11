@[Link(ldflags: "#{__DIR__}/smaz/smaz.o")]
lib LibSmaz
  fun compress = smaz_compress(in : LibC::Char*, inlen : LibC::Int, out : LibC::Char*, outlen : LibC::Int) : LibC::Int
  fun decompress = smaz_decompress(in : LibC::Char*, inlen : LibC::Int, out : LibC::Char*, outlen : LibC::Int) : LibC::Int
end
