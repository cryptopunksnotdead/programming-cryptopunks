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


ids = [2204,   741,
       1050,   510,
       641,    281,
       6487,   3307]
ids.each do |id|
  punk = punks[id]
  pp colors = punk.pixels.uniq

  pp colors.count

  usage = Hash.new(0)
  punk.pixels.each do |color|
    usage[ color ] += 1
  end
  pp usage

  usage.each do |color,count|
    print "%3d  " % count
    print Color.format( color )
    print "\n"
  end
end



ids = [6043]
ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  punk.save( "./i/punk-#{name}.png" )
  punk.zoom(4).save( "./i/punk-#{name}x4.png" )
end



