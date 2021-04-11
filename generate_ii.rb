###
#  to run use:
#     ruby ./generate_ii.rb


require 'chunky_png'


PARTS = {
  face:     { },
  hair:     { offset: [7, 1] },
  glasses:  { offset: [6, 7] },
  beard:    { offset: [11, 19] },
}



def generate_punk( codes )
  punk = ChunkyPNG::Image.new( 24, 24, ChunkyPNG::Color::WHITE )

  PARTS.each_with_index do |(key,part),i|
    code  = codes[i]
    if code != 0    ## if code 0 - let's you skip optional part

      ## compose parts on top (from face to beard)
      path = "./i/parts_ii/#{key}/#{key}#{code}.png"
      img  = ChunkyPNG::Image.from_file( path )
      x, y = part[:offset] || [0, 0]
      punk.compose!( img, x, y )
    end
  end

  punk
end


codes = [1,1,0,0]     # face, hair, glasses, beard
punk = generate_punk( codes )
punk.save( "./punk-#{codes.join}.png" )

codes = [2,3,0,1]
punk = generate_punk( codes )
punk.save( "./punk-#{codes.join}.png" )

codes = [3,0,1,2]
punk = generate_punk( codes )
punk.save( "./punk-#{codes.join}.png" )


puts "bye"

