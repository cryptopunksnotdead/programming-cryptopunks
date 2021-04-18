###
#  to run use:
#     ruby ./palette_8bit.rb



require 'cryptopunks'

punks = Punks::Image.read( './punks.png' )

ids = [2, 532, 58, 30, 635, 602, 768, 603, 757]
ids.each do |id|
  name = '%04d' % id
  punks[id].save( "./i/punk-#{name}.png" )
end



require 'pixelart'

ids.each do |id|
  name = '%04d' % id
  punk = Image.read( "./i/punk-#{name}.png" )

  punk_bw = punk.grayscale
  punk_bw.save( "./i/punk-#{name}_bw.png" )
  punk_bw.scale( 4 ).save( "./i/punk-#{name}_bw4x.png" )
end



def show_colors( img )
  colors = Hash.new(0)

  img.width.times do |x|
    img.height.times do |y|
      color = img[x,y]
      colors[color] += 1
    end
  end

  puts "#{colors.size} color(s):"
  colors.each_with_index do |(color,count),i|
    print "  [#{i}]  "
    print '%3d pixel(s) - ' % count
    print Color.format( color )
    print "\n"
  end
end



punk = Image.read( "./i/punk-0002.png" )
puts "before:"
show_colors( punk )

punk_bw = punk.grayscale
puts "after:"
show_colors( punk_bw )


ids.each do |id|
  name = '%04d' % id
  punk = Image.read( "./i/punk-#{name}.png" )

  punk_sepia = punk.change_palette8bit( Palette8bit::SEPIA )
  punk_sepia.save( "./i/punk-#{name}_sepia.png" )
  punk_sepia.scale( 4 ).save( "./i/punk-#{name}_sepia4x.png" )

  punk_blue = punk.change_palette8bit( Palette8bit::BLUE )
  punk_blue.save( "./i/punk-#{name}_blue.png" )
  punk_blue.scale( 4 ).save( "./i/punk-#{name}_blue4x.png" )

  punk_false = punk.change_palette8bit( Palette8bit::FALSE )
  punk_false.save( "./i/punk-#{name}_false.png" )
  punk_false.scale( 4 ).save( "./i/punk-#{name}_false4x.png" )
end


puts "bye"
