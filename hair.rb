###
#  to run use:
#     ruby ./hair.rb


require 'cryptopunks'


punkette_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . @ ^ ~ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ x x ^ ^ ^ x x @ . . . . . . .
. . . . . . @ ^ ^ @ o ^ ^ ^ @ o @ . . . . . . .
. . . . . . @ @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ @ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ % % % ^ ^ @ . . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . . @ ^ @ ^ ^ ^ @ . . . . . . . . .
. . . . . . . . @ ^ ^ @ @ @ . . . . . . . . . .
. . . . . . . . @ ^ ^ ^ @ . . . . . . . . . . .
. . . . . . . . @ ^ ^ ^ @ . . . . . . . . . . .
TXT

HUMAN_COLORS_LIGHT = ['000000','a66e2c','d29d60','dbb180','e7cba9','711010']

punkette = Image.parse( punkette_design, colors: HUMAN_COLORS_LIGHT )

punkette.save( './i/punkette_light.png' )
punkette.zoom(4).save( './i/punkette_lightx4.png' )


sidehair_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ @ . . . . . . . . . .
. . . . . . . . @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . . @ @ . . . . @ . @ @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ . . . . . . . . . @ @ . . . . . .
. . . . . . @ . . . . . . . . . @ @ . . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . @ @ @ @ . . . . .
. . . . . . . . . . . . . . @ @ @ @ @ . . . . .
. . . . . . . . . . . . . . @ @ @ . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

ORANGE = 'e65700'

sidehair = Image.parse( sidehair_design, colors: [ORANGE] )
sidehair.save( './i/sidehair_orange.png' )
sidehair.zoom(4).save('./i/sidehair_orangex4.png')



punkette.compose!( sidehair )
punkette.save( './i/punkette_light_side_orange.png' )
punkette.zoom(4).save( './i/punkette_light_side_orangex4.png' )



BLACK      = '000000'
BRUNETTE   = '51360c'
RED        = 'e22626'
YELLOW     = 'ffd926'
GREEN      = '28b143'
BLONDE     = 'fff68e'
WHITESMOKE = 'f5f5f5'


hair_colors = {
  'black'      => BLACK,
  'brunette'   => BRUNETTE,
  'red'        => RED,
  'orange'     => ORANGE,
  'green'      => GREEN,
  'blonde'     => BLONDE,
  'whitesmoke' => WHITESMOKE,
}


hair_colors.each do |hair_color_name, hair_color|
  punkette = Image.parse( punkette_design, colors: HUMAN_COLORS_LIGHT )
  hair     = Image.parse( sidehair_design, colors: [hair_color] )

  punkette.compose!( hair )

  name = "light_side_#{hair_color_name}"
  punkette.save( "./i/punkette_#{name}.png" )
  punkette.zoom(4).save( "./i/punkette_#{name}x4.png" )
end







puts "bye"