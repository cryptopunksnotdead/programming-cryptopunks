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





def parse_color( color )
  if color.is_a?( String )
    ChunkyPNG::Color.from_hex( color )
  elsif color.is_a?( Array )
    ChunkyPNG::Color.from_hsl( *color )
  else
     raise ArgumentError, "unkown color format; cannot parse - expected hex string or hsl array"
  end
end

def prepare_color_map( color_map )
   color_map.map do |k,v|
     [parse_color(k),  parse_color(v)]
   end.to_h
end


## add recolor, replace_colors alias(es)? - why? why not?
def change_colors( img, color_map )
  img = img.dup  ## note: make a deep copy!!!
  color_map = prepare_color_map( color_map )
  ## pp color_map

  img.width.times do |x|
    img.height.times do |y|
      color = img[x,y]
      new_color = color_map[color]
      img[x,y] = new_color  if new_color
    end
  end
  img
end


ids = [635, 2890, 3100, 3443, 5822, 5905, 6089, 7523, 7804]
ids.each do |id|
  name = '%04d' % id
  img = ChunkyPNG::Image.from_file( "./i/punk-#{name}.png" )

  [180, 150, 120, 90, 60, 30, 0, 330, 300].each do |hue|
     saturation =  0.13
     lightness  = -0.30
     color_map = {
      '#c8fbfbff' => [hue, 0.86+saturation, 0.88+lightness],
      '#75bdbdff' => [hue, 0.35+saturation, 0.60+lightness],
      '#9be0e0ff' => [hue, 0.52+saturation, 0.74+lightness],
     }

     new_img = change_colors( img, color_map )
     new_img.save( "./i/punk-#{name}_#{hue}.png")
  end
end




