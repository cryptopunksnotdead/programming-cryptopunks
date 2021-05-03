###
#  to run use:
#     ruby ./humans.rb


require 'cryptopunks'

punks = Punks::Image::Composite.read( './punks.png' )

ids = [3307, 281, 510, 741]
ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  punk.save( "./i/punk-#{name}.png" )
  punk.zoom(4).save( "./i/punk-#{name}x4.png" )
end



ids = [6487, 641, 1050, 2204]
ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  punk.save( "./i/punk-#{name}.png" )
  punk.zoom(4).save( "./i/punk-#{name}x4.png" )
end
