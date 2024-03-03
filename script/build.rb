###########
# to run use:
#    $ ruby script/build.rb



chapters = [
    '01_crop.md',
    '02_attributes.md',
    '03_generate.md'
]


pp chapters

pandoc = 'c:\prg\pandoc3.1.11.1\pandoc.exe'

cmd = "#{pandoc} #{chapters.join( ' ')} "
# cmd += "--extract-media build "

# cmd += "--table-of-contents "
# cmd += "--toc-depth 3 "

cmd += "--standalone "
cmd += "-o build/book.tex"
pp cmd


puts "==> calling #{cmd}..."

system( cmd )

puts "bye"

