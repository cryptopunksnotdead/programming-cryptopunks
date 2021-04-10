###
#  to run use:
#     ruby ./generate.rb


require 'chunky_png'


PARTS = {
  face:  { required: true,
           attributes: [['', 'u'],
                        ['', 'u']] },
  mouth: { required: true,
           attributes: [['Black Lipstick',  'f'],
                        ['Red Lipstick',    'f'],
                        ['Smile',           'u'],
                        ['',                'u'],
                        ['Teeth Smile',     'm'],
                        ['Purple Lipstick', 'f']] },
  nose:  { required: true,
           attributes: [['',          'u'],
                        ['Nose Ring', 'u']] },
  eyes:  { required: true,
           attributes: [['',              'u'],
                        ['Asian Eyes',    'u'],
                        ['Sun Glasses',   'u'],
                        ['Red Glasses',   'u'],
                        ['Round Eyes',    'u']] },
  ears:  { required: true,
           attributes: [['',              'u'],
                        ['Left Earring',  'u'],
                        ['Right Earring', 'u'],
                        ['Two Earrings',  'u']] },
  beard: { required: false,
           attributes: [['Brown Beard',     'm'],
                        ['',                'u'],
                        ['Mustache-Beard',  'm'],
                        ['',                'u'],
                        ['Mustache',        'm'],
                        ['',                'u'],
                        ['Regular Beard',   'm'],
                        ['',                'u']] },
  hair:  { required: false,
           attributes: [['Up Hair',        'm'],
                        ['Down Hair',      'u'],
                        ['Mahawk',         'u'],
                        ['Red Mahawk',     'u'],
                        ['Orange Hair',    'u'],
                        ['Bubble Hair',    'm'],
                        ['Emo Hair',       'u'],
                        ['Thin Hair',      'm'],
                        ['Bald',           'm'],
                        ['Blonde Hair',    'f'],
                        ['Caret Hair',     'f'],
                        ['Pony Tails'      'f']] },
  access: { required: false,
            attributes: [['Cigar',        'u'],
                         ['Pipe',         'u']] }
}



def generate_punk( codes )
  punk = ChunkyPNG::Image.new( 560, 560, ChunkyPNG::Color::WHITE )

  PARTS.each_with_index do |(key,part),i|
    code  = codes[i]
    if code != 0
      attribute = part[:attributes][ code-1 ]
      puts "#{key}#{code} - #{attribute[0]} (#{attribute[1]})"  if attribute[0].size > 0

      path = "./i/parts/#{key}/#{key}#{code}.png"
      part = ChunkyPNG::Image.from_file( path )
      punk.compose!( part, 0, 0 )
    end
  end

  punk
end


codes = [2, 2, 2, 3, 1, 0, 10, 1]
generate_punk( codes ).save( "./punk-0000.png" )

codes = [1, 5, 2, 3, 1, 1, 5, 1]
generate_punk( codes ).save( "./punk-0001.png" )


