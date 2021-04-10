###
#  to run use:
#     ruby ./mint.rb


require 'cryptopunks'

punks = Punks::Image.read( './punks.png' )


punks[0].save( './punk-0000.png' )
punks[2890].save( './punk-2890.png' )
punks[8219].save( './punk-8219.png')

punks.zoom = 4   # use x4

punks[0].save( './punk-0000x4.png' )
punks[2890].save( './punk-2890x4.png' )
punks[8219].save( './punk-8219x4.png')

punks.zoom = 8   # or use x8

punks[0].save( './punk-0000x4.png' )
punks[2890].save( './punk-2890x4.png' )
punks[8219].save( './punk-8219x4.png')
