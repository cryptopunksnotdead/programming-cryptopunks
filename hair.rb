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



skin_tones = {
  'lighter' => HUMAN_COLORS_LIGHTER,
  'light'   => HUMAN_COLORS_LIGHT,
  'dark'    => HUMAN_COLORS_DARK,
  'darker'  => HUMAN_COLORS_DARKER
}

hair_colors.each do |hair_color_name, hair_color|
  hair     = Image.parse( sidehair_design, colors: [hair_color] )

  skin_tones.each do |skin_tone_name, skin_tone_colors|
    punkette = Image.parse( punkette_design, colors: skin_tone_colors )

    punkette.compose!( hair )

    name = "#{skin_tone_name}_side_#{hair_color_name}"
    punkette.save( "./i/punkette_#{name}.png" )
    punkette.zoom(4).save( "./i/punkette_#{name}x4.png" )
  end
end



wildhair_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ @ . @ . . . . . . . .
. . . . . . . @ . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . @ . . . . . .
. . . . . @ @ @ @ @ @ @ @ @ @ @ @ . @ . . . . .
. . . . . . @ @ @ @ . @ @ @ @ @ @ @ @ . . . . .
. . . . . @ @ @ @ . @ . @ . . @ @ @ . . . . . .
. . . . @ . @ @ @ . . . @ . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . @ . . . . @ . @ . . . .
. . . . @ . @ . . . . . . @ . . . @ @ . . . . .
. . . @ @ @ @ . . . . . . . . . . @ @ . . . . .
. . . . . @ @ . . . . . . . . . . @ @ @ . . . .
. . . . . @ @ . . . . . . . . . . @ . . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT


wildhair = Image.parse( wildhair_design, colors: [BLACK] )
wildhair.save( './i/wildhair_black.png' )
wildhair.zoom(4).save('./i/wildhair_blackx4.png')



mohawk_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . @ @ . . . . . . . . .
. . . . . . . . . . . . @ @ @ . . . . . . . . .
. . . . . . . . . . . @ @ @ @ . . . . . . . . .
. . . . . . . . . . @ @ @ @ @ . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . . . . . . @ @ . . . . . . . . . .
. . . . . . . . . . . . . @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

bob_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . @ @ @ @ @ @ @ @ . @ @ @ . . . . . .
. . . . . . @ @ . @ @ @ @ . . . @ @ . . . . . .
. . . . . . @ @ . . . @ . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . @ @ @ @ @ . . . . . . . @ @ @ @ . . . .
. . . . . . @ @ @ @ . . . . . @ @ . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

clown_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ . . . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . @ @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . . .
. . . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . .
. . . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . .
. . . @ @ @ @ @ @ @ . . . . @ @ @ @ @ @ . . . .
. . . @ @ @ @ @ . . . . . . . . @ @ @ @ . . . .
. . . @ @ @ @ . . . . . . . . . @ @ @ @ . . . .
. . . . @ @ . . . . . . . . . . @ @ @ . . . . .
. . . . @ @ . . . . . . . . . . . @ @ . . . . .
. . . . @ @ . . . . . . . . . . . . @ . . . . .
. . . . . @ @ . . . . . . . . . . @ . . . . . .
. . . . . . @ . . . . . . . . . . @ . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

straight_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . . @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . @ @ @ @ . . . . . @ @ . . . . . . .
. . . . . . @ @ @ . . . . . . . @ . . . . . . .
. . . . . . @ @ @ . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . . @ . . . . . . .
. . . . . @ @ @ . . . . . . . @ @ . . . . . . .
. . . . . @ @ @ . . . . . . @ @ @ . . . . . . .
. . . . . @ @ @ . . . . . @ @ @ . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

pigtails_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . @ @ . . @ @ @ @ @ @ @ @ . . @ @ . . . .
. . . @ @ @ @ x @ @ @ @ @ @ @ @ x @ @ @ @ . . .
. . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . .
. . @ @ @ @ . @ @ @ . . . . . @ @ . @ @ @ @ . .
. . @ @ @ . . @ @ . . . . . . . @ . . @ @ @ . .
. . @ @ @ . . @ . . . . . . . . . . . @ @ @ . .
. . . @ . . . . . . . . . . . . . . . . @ . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT



hair_styles = {
  'side'     => sidehair_design,
  'wild'     => wildhair_design,
  'mohawk'   => mohawk_design,
  'bob'      => bob_design,
  'clown'    => clown_design,
  'straight' => straight_design,
  'pigtails' => { design: pigtails_design,
                  more_colors: [YELLOW],
                }
}




hair_styles.each do |hair_style_name, hair_style|
  hair_colors.each do |hair_color_name, hair_color|
    hair = if hair_style.is_a?( String )
      Image.parse( hair_style, colors: [hair_color] )
    else
      ## assume hash table with extra settings
      ## (e.g colors for accessoires etc.)
      Image.parse( hair_style[:design],
                   colors: [hair_color]+hair_style[:more_colors] )
    end

    skin_tones.each do |skin_tone_name, skin_tone_colors|
      punkette = Image.parse( punkette_design, colors: skin_tone_colors )

      punkette.compose!( hair )

      name = "#{skin_tone_name}_#{hair_style_name}_#{hair_color_name}"
      punkette.save( "./i/punkette_#{name}.png" )
      punkette.zoom(4).save( "./i/punkette_#{name}x4.png" )
    end
  end
end


puts "bye"
