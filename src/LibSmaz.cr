@[Link(ldflags: "#{__DIR__}/smaz/smaz.o")]
lib LibSmaz
  fun compress = smaz_compress(in : LibC::Char*, len : LibC::SizeT, out : LibC::Char*, bufsize : LibC::SizeT) : LibC::SizeT
  fun decompress = smaz_decompress(in : LibC::Char*, len : LibC::SizeT, out : LibC::Char*, bufsize : LibC::SizeT) : LibC::SizeT
end
