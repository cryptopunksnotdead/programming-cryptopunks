###
#  to run use:
#     ruby ./crop.rb


require 'pixelart'

punks = ImageComposite.read( './punks.png' )



punks[0].save( './i/punk-0000.png' )
punks[2890].save( './i/punk-2890.png' )
punks[8219].save( './i/punk-8219.png')


punks[0].zoom(4).save( './i/punk-0000x4.png' )   # use x4
punks[2890].zoom(4).save( './i/punk-2890x4.png' )
punks[8219].zoom(4).save( './i/punk-8219x4.png')


punks[0].zoom(8).save( './i/punk-0000x8.png' )    # or use x8
punks[2890].zoom(8).save( './i/punk-2890x8.png' )
punks[8219].zoom(8).save( './i/punk-8219x8.png')




###
#  add Christie's:
#    9 rare CryptoPunks to star in our 21st Century Evening Sale this May in New York.
#    All mint numbers under 1k and yes there is a rare Alien!
#    Punks 2, 532, 58, 30, 635, 602, 768, 603, 757.

punks[2].save( './i/punk-0002.png' )
punks[532].save( './i/punk-0532.png' )
punks[58].save( './i/punk-0058.png' )
punks[30].save( './i/punk-0030.png' )
punks[635].save( './i/punk-0635.png' )
punks[602].save( './i/punk-0602.png' )
punks[768].save( './i/punk-0768.png' )
punks[603].save( './i/punk-0603.png' )
punks[757].save( './i/punk-0757.png' )




punks = ImageComposite.read( './i/more-punks-1.png' )

punks[0].save('./i/punk-10000.png')
punks[18].save('./i/punk-10018.png')
punks[40].save('./i/punk-10040.png')
punks[88].save('./i/punk-10088.png')

punks[0].zoom(4).save('./i/punk-10000x4.png')
punks[18].zoom(4).save('./i/punk-10018x4.png')
punks[40].zoom(4).save('./i/punk-10040x4.png')
punks[88].zoom(4).save('./i/punk-10088x4.png')


punks = ImageComposite.read( './i/more-punks-2.png' )

punks[0].save('./i/punk-10100.png')
punks[79].save('./i/punk-10179.png')
punks[80].save('./i/punk-10180.png')
punks[90].save('./i/punk-10190.png')

punks[0].zoom(4).save('./i/punk-10100x4.png')
punks[79].zoom(4).save('./i/punk-10179x4.png')
punks[80].zoom(4).save('./i/punk-10180x4.png')
punks[90].zoom(4).save('./i/punk-10190x4.png')

