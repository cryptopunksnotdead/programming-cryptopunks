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



###
#  add Christie's:
#    9 rare CryptoPunks to star in our 21st Century Evening Sale this May in New York.
#    All mint numbers under 1k and yes there is a rare Alien!
#    Punks 2, 532, 58, 30, 635, 602, 768, 603, 757.

punks.zoom = 1   # back to original 24×24 pixel format

punks[2].save( './punk-0002.png' )
punks[532].save( './punk-0532.png' )
punks[58].save( './punk-0058.png' )
punks[30].save( './punk-0030.png' )
punks[635].save( './punk-0635.png' )
punks[602].save( './punk-0602.png' )
punks[768].save( './punk-0768.png' )
punks[603].save( './punk-0603.png' )
punks[757].save( './punk-0757.png' )


