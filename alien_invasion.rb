###
#  to run use:
#     ruby ./alien_invasion.rb



require 'cryptopunks'

punks = Punks::Image.read( './punks.png' )

ids = [635, 2890, 3100, 3443, 5822, 5905, 6089, 7523, 7804]
ids.each do |id|
  name = '%04d' % id
  punks[id].save( "./i/punk-#{name}.png" )
end



require 'pixelart'

punk = Pixelart::Image.read( './i/punk-3100.png' )
pp punk.pixels.count         # total pixels - 24×24
pp punk.pixels.uniq.count    # total colors - unique colored pixels

pp punk.pixels.uniq


punk.pixels.uniq.each_with_index do |color, i|
  hex = Pixelart::Color.to_hex( color )   # rgba in hex (string format)
  hsl = Pixelart::Color.to_hsl( color )
  print "[#{i}]  "
  print hex
  print "  "
  print   hsl.inspect
  print "\n"
end



ids = [635, 2890, 3100, 3443, 5822, 5905, 6089, 7523, 7804]
ids.each do |id|
  name = '%04d' % id
  punk = Pixelart::Image.read( "./i/punk-#{name}.png" )

  [180, 150, 120, 90, 60, 30, 0, 330, 300].each do |hue|
     saturation =  0.13
     lightness  = -0.30
     color_map = {
      '#c8fbfbff' => [hue, 0.86+saturation, 0.88+lightness],
      '#75bdbdff' => [hue, 0.35+saturation, 0.60+lightness],
      '#9be0e0ff' => [hue, 0.52+saturation, 0.74+lightness],
     }

     new_punk = punk.change_colors( color_map )
     new_punk.save( "./i/punk-#{name}_#{hue}.png")
     new_punk.zoom(3).save( "./i/punk-#{name}_#{hue}x3.png")
  end
end


