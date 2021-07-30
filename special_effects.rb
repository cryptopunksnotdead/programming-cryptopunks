###
#  to run use:
#     ruby ./special_effects.rb


require 'cryptopunks'

punks = Punks::Image::Composite.read( './punks.png' )


ids = [3100, 3393, 172, 2964]

ids.each do |id|
  name = '%04d' % id
  punk = punks[id]

  ## zoom 4x, 8x
  punk.zoom(4).save( "./i/punk-#{name}x4.png" )
  punk.zoom(8).save( "./i/punk-#{name}x8.png" )

  ## mirror - from right-facing to left-facing
  punk.mirror.save( "./i/phunk-#{name}.png" )
  punk.mirror.zoom(4).save( "./i/phunk-#{name}x4.png" )

  ## 8bit-color palette
  punk.grayscale.save( "./i/punk-#{name}_bw.png" )
  punk.grayscale.zoom(4).save( "./i/punk-#{name}_bwx4.png" )
end



