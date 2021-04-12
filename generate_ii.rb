###
#  to run use:
#     ruby ./generate_ii.rb


require 'pixelart'


PARTS = {
  face:     { },
  hair:     { offset: [7, 1] },
  glasses:  { offset: [6, 7] },
  beard:    { offset: [11, 19] },
}



def generate_punk( codes )
  punk = Pixelart::Image.new( 24, 24 )

  PARTS.each_with_index do |(key,part),i|
    code  = codes[i]
    if code != 0    ## if code 0 - let's you skip optional part

      ## compose parts on top (from face to beard)
      path = "./i/parts_ii/#{key}/#{key}#{code}.png"
      img  = Pixelart::Image.read( path )
      x, y = part[:offset] || [0, 0]
      punk.compose!( img, x, y )
    end
  end

  punk
end


codes = [1,1,0,0]     # face, hair, glasses, beard
punk = generate_punk( codes )
punk.save( "./tmp/punk-#{codes.join}.png" )

punk3x = punk.zoom( 3 )
punk3x.save( "./tmp/punk-#{codes.join}x3.png")


codes = [2,3,0,1]
punk = generate_punk( codes )
punk.save( "./tmp/punk-#{codes.join}.png" )
punk.zoom(3).save( "./tmp/punk-#{codes.join}x3.png" )


codes = [3,0,1,2]
punk = generate_punk( codes )
punk.save( "./tmp/punk-#{codes.join}.png" )
punk.zoom(3).save( "./tmp/punk-#{codes.join}x3.png" )


puts "bye"

