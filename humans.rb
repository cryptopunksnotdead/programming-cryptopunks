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




punk = punks[6043]
punk.save( "./i/punk-6043.png" )
punk.zoom(4).save( "./i/punk-6043x4.png" )

darker_to_dark = {
 '#713f1d' => '#ae8b61',
 '#8b532c' => '#b69f82',
 '#562600' => '#86581e',
 '#723709' => '#a77c47',
 '#4a1201' => '#5f1d09',
}

punk_dark = punk.change_colors( darker_to_dark )
punk_dark.save( "./i/punk-6043_dark.png" )
punk_dark.zoom(4).save( "./i/punk-6043_darkx4.png" )

darker_to_light = {
 '#713f1d' => '#dbb180',
 '#8b532c' => '#e7cba9',
 '#562600' => '#a66e2c',
 '#723709' => '#d29d60',
 '#4a1201' => '#711010',
}

punk_light = punk.change_colors( darker_to_light )
punk_light.save( "./i/punk-6043_light.png" )
punk_light.zoom(4).save( "./i/punk-6043_lightx4.png" )


darker_to_lighter = {
 '#713f1d' => '#ead9d9',
 '#8b532c' => '#ffffff',
 '#562600' => '#a58d8d',
 '#723709' => '#c9b2b2',
 '#4a1201' => '#711010',
}

punk_lighter = punk.change_colors( darker_to_lighter )
punk_lighter.save( "./i/punk-6043_lighter.png" )
punk_lighter.zoom(4).save( "./i/punk-6043_lighterx4.png" )
