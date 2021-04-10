###
#  to run use:
#     ruby ./generate_ii.rb


require 'chunky_png'


PARTS = {
  face:     { },
  hair:     { offset: [94, 5] },
  glasses:  { offset: [73, 86] },
  beard:    { offset: [147, 258] },
}


def generate_punk( codes )
  punk = ChunkyPNG::Image.new( 336, 336, ChunkyPNG::Color::WHITE )

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

codes = [3,0,2,2]
punk = generate_punk( codes )
punk.save( "./punk-#{codes.join}.png" )


puts "bye"

