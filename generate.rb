###
#  to run use:
#     ruby ./generate.rb


require 'pixelart'


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
                        ['Mustache-Beard',  'm'],
                        ['Mustache',        'm'],
                        ['Regular Beard',   'm']] },
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
                        ['Blonde Hair',    'f']] }
 }



def generate_punk( codes )
  punk = Pixelart::Image.new( 56, 56 )

  PARTS.each_with_index do |(key,part),i|
    code  = codes[i]
    if code != 0
      attribute = part[:attributes][ code-1 ]
      puts "#{key}#{code} - #{attribute[0]} (#{attribute[1]})"  if attribute[0].size > 0

      path = "./i/parts/#{key}/#{key}#{code}.png"
      part = Pixelart::Image.read( path )
      punk.compose!( part )
    end
  end

  punk
end


codes = [2, 2, 2, 3, 1, 0, 10]
punk = generate_punk( codes )
punk.save( "./tmp/punk-0000.png" )

punk3x = punk.zoom( 3 )
punk3x.save( "./tmp/punk-0000x3.png" )

puts "---"

codes = [1, 5, 2, 3, 1, 1, 5]
punk = generate_punk( codes )
punk.save( "./tmp/punk-0001.png" )

punk3x = punk.zoom( 3 )
punk3x.save( "./tmp/punk-0001x3.png" )

puts "bye"
