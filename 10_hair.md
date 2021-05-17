# 7 Quick & Easy Hairstyles with Simple Instructions to Do in a Few Minutes - Trendy Ideas for Punkettes to Try in 2021 - Is Orange the New Black?



Let's try out some hair dos and colors.
What's trendy in 2021?

Step 0: Let's start with a (bald no hair) female human punk archetype, that is, a "plain vanilla" zero-attributes design:


``` ruby
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

punkette.save( 'punkette_light.png' )
punkette.zoom(4).save( 'punkette_lightx4.png' )
```


![](i/punkette_light.png)
![](i/punkette_lightx4.png)




Salon hair time! Let's add a hair style.
Let's start with the side hair style in orange (that's the only
hair color in the original Lavra Lab series from 2017 with a side hair style do):


``` ruby
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
sidehair.save( 'sidehair_orange.png' )
sidehair.zoom(4).save('sidehair_orangex4.png')
```

![](i/sidehair_orange.png)
![](i/sidehair_orangex4.png)



and all together:

``` ruby
punkette.compose!( sidehair )
punkette.save( 'punkette_light_side_orange.png' )
punkette.zoom(4).save( 'punkette_light_side_orangex4.png' )
```

![](i/punkette_light_side_orange.png)
![](i/punkette_light_side_orangex4.png)



Is Black the New Black? Let's try out more hair colors:

``` ruby
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
  punkette.save( "punkette_#{name}.png" )
  punkette.zoom(4).save( "punkette_#{name}x4.png" )
end
```

Voila!

![](i/punkette_light_side_black.png)
![](i/punkette_light_side_brunette.png)
![](i/punkette_light_side_red.png)
![](i/punkette_light_side_orange.png)
![](i/punkette_light_side_green.png)
![](i/punkette_light_side_blonde.png)
![](i/punkette_light_side_whitesmoke.png)

![](i/punkette_light_side_blackx4.png)
![](i/punkette_light_side_brunettex4.png)
![](i/punkette_light_side_redx4.png)
![](i/punkette_light_side_orangex4.png)
![](i/punkette_light_side_greenx4.png)
![](i/punkette_light_side_blondex4.png)
![](i/punkette_light_side_whitesmokex4.png)


And let's try how the colors match with all skin tones (ligher, light, dark, darker):

``` ruby
skin_tones = {
  'lighter' => HUMAN_COLORS_LIGHTER,
  'light'   => HUMAN_COLORS_LIGHT,
  'dark'    => HUMAN_COLORS_DARK,
  'darker'  => HUMAN_COLORS_DARKER
}
```

and adjusting the hair stylist loop:

``` ruby
hair_colors.each do |hair_color_name, hair_color|
  hair = Image.parse( sidehair_design, colors: [hair_color] )

  skin_tones.each do |skin_tone_name, skin_tone_colors|
    punkette = Image.parse( punkette_design, colors: skin_tone_colors )

    punkette.compose!( hair )

    name = "#{skin_tone_name}_side_#{hair_color_name}"
    punkette.save( "punkette_#{name}.png" )
    punkette.zoom(4).save( "punkette_#{name}x4.png" )
  end
end
```

Voila!

![](i/punkette_lighter_side_black.png)
![](i/punkette_lighter_side_brunette.png)
![](i/punkette_lighter_side_red.png)
![](i/punkette_lighter_side_orange.png)
![](i/punkette_lighter_side_green.png)
![](i/punkette_lighter_side_blonde.png)
![](i/punkette_lighter_side_whitesmoke.png)

![](i/punkette_light_side_black.png)
![](i/punkette_light_side_brunette.png)
![](i/punkette_light_side_red.png)
![](i/punkette_light_side_orange.png)
![](i/punkette_light_side_green.png)
![](i/punkette_light_side_blonde.png)
![](i/punkette_light_side_whitesmoke.png)

![](i/punkette_dark_side_black.png)
![](i/punkette_dark_side_brunette.png)
![](i/punkette_dark_side_red.png)
![](i/punkette_dark_side_orange.png)
![](i/punkette_dark_side_green.png)
![](i/punkette_dark_side_blonde.png)
![](i/punkette_dark_side_whitesmoke.png)

![](i/punkette_darker_side_black.png)
![](i/punkette_darker_side_brunette.png)
![](i/punkette_darker_side_red.png)
![](i/punkette_darker_side_orange.png)
![](i/punkette_darker_side_green.png)
![](i/punkette_darker_side_blonde.png)
![](i/punkette_darker_side_whitesmoke.png)

4x

![](i/punkette_lighter_side_blackx4.png)
![](i/punkette_lighter_side_brunettex4.png)
![](i/punkette_lighter_side_redx4.png)
![](i/punkette_lighter_side_orangex4.png)
![](i/punkette_lighter_side_greenx4.png)
![](i/punkette_lighter_side_blondex4.png)
![](i/punkette_lighter_side_whitesmokex4.png)

![](i/punkette_light_side_blackx4.png)
![](i/punkette_light_side_brunettex4.png)
![](i/punkette_light_side_redx4.png)
![](i/punkette_light_side_orangex4.png)
![](i/punkette_light_side_greenx4.png)
![](i/punkette_light_side_blondex4.png)
![](i/punkette_light_side_whitesmokex4.png)

![](i/punkette_dark_side_blackx4.png)
![](i/punkette_dark_side_brunettex4.png)
![](i/punkette_dark_side_redx4.png)
![](i/punkette_dark_side_orangex4.png)
![](i/punkette_dark_side_greenx4.png)
![](i/punkette_dark_side_blondex4.png)
![](i/punkette_dark_side_whitesmokex4.png)

![](i/punkette_darker_side_blackx4.png)
![](i/punkette_darker_side_brunettex4.png)
![](i/punkette_darker_side_redx4.png)
![](i/punkette_darker_side_orangex4.png)
![](i/punkette_darker_side_greenx4.png)
![](i/punkette_darker_side_blondex4.png)
![](i/punkette_darker_side_whitesmokex4.png)




What's trendy in 2021?
Let's try out some more hair dos.

``` ruby
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
wildhair.save( 'wildhair_black.png' )
wildhair.zoom(4).save('wildhair_blackx4.png')
```

![](i/wildhair_black.png)
![](i/wildhair_blackx4.png)



and let's adjust the hair stylist loop one more time:

``` ruby
hair_styles = {
  'side'     => sidehair_design,
  'wild'     => wildhair_design,
}

hair_styles.each do |hair_style_name, hair_style|
  hair_colors.each do |hair_color_name, hair_color|
    hair = Image.parse( hair_style, colors: [hair_color] )

    skin_tones.each do |skin_tone_name, skin_tone_colors|
      punkette = Image.parse( punkette_design, colors: skin_tone_colors )

      punkette.compose!( hair )

      name = "#{skin_tone_name}_#{hair_style_name}_#{hair_color_name}"
      punkette.save( "punkette_#{name}.png" )
      punkette.zoom(4).save( "punkette_#{name}x4.png" )
    end
  end
end
```

Voila!


![](i/punkette_lighter_wild_black.png)
![](i/punkette_lighter_wild_brunette.png)
![](i/punkette_lighter_wild_red.png)
![](i/punkette_lighter_wild_orange.png)
![](i/punkette_lighter_wild_green.png)
![](i/punkette_lighter_wild_blonde.png)
![](i/punkette_lighter_wild_whitesmoke.png)

![](i/punkette_light_wild_black.png)
![](i/punkette_light_wild_brunette.png)
![](i/punkette_light_wild_red.png)
![](i/punkette_light_wild_orange.png)
![](i/punkette_light_wild_green.png)
![](i/punkette_light_wild_blonde.png)
![](i/punkette_light_wild_whitesmoke.png)

![](i/punkette_dark_wild_black.png)
![](i/punkette_dark_wild_brunette.png)
![](i/punkette_dark_wild_red.png)
![](i/punkette_dark_wild_orange.png)
![](i/punkette_dark_wild_green.png)
![](i/punkette_dark_wild_blonde.png)
![](i/punkette_dark_wild_whitesmoke.png)

![](i/punkette_darker_wild_black.png)
![](i/punkette_darker_wild_brunette.png)
![](i/punkette_darker_wild_red.png)
![](i/punkette_darker_wild_orange.png)
![](i/punkette_darker_wild_green.png)
![](i/punkette_darker_wild_blonde.png)
![](i/punkette_darker_wild_whitesmoke.png)

4x

![](i/punkette_lighter_wild_blackx4.png)
![](i/punkette_lighter_wild_brunettex4.png)
![](i/punkette_lighter_wild_redx4.png)
![](i/punkette_lighter_wild_orangex4.png)
![](i/punkette_lighter_wild_greenx4.png)
![](i/punkette_lighter_wild_blondex4.png)
![](i/punkette_lighter_wild_whitesmokex4.png)

![](i/punkette_light_wild_blackx4.png)
![](i/punkette_light_wild_brunettex4.png)
![](i/punkette_light_wild_redx4.png)
![](i/punkette_light_wild_orangex4.png)
![](i/punkette_light_wild_greenx4.png)
![](i/punkette_light_wild_blondex4.png)
![](i/punkette_light_wild_whitesmokex4.png)

![](i/punkette_dark_wild_blackx4.png)
![](i/punkette_dark_wild_brunettex4.png)
![](i/punkette_dark_wild_redx4.png)
![](i/punkette_dark_wild_orangex4.png)
![](i/punkette_dark_wild_greenx4.png)
![](i/punkette_dark_wild_blondex4.png)
![](i/punkette_dark_wild_whitesmokex4.png)

![](i/punkette_darker_wild_blackx4.png)
![](i/punkette_darker_wild_brunettex4.png)
![](i/punkette_darker_wild_redx4.png)
![](i/punkette_darker_wild_orangex4.png)
![](i/punkette_darker_wild_greenx4.png)
![](i/punkette_darker_wild_blondex4.png)
![](i/punkette_darker_wild_whitesmokex4.png)


And

``` ruby
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
```

Voila!


![](i/punkette_lighter_mohawk_black.png)
![](i/punkette_lighter_mohawk_brunette.png)
![](i/punkette_lighter_mohawk_red.png)
![](i/punkette_lighter_mohawk_orange.png)
![](i/punkette_lighter_mohawk_green.png)
![](i/punkette_lighter_mohawk_blonde.png)
![](i/punkette_lighter_mohawk_whitesmoke.png)

![](i/punkette_light_mohawk_black.png)
![](i/punkette_light_mohawk_brunette.png)
![](i/punkette_light_mohawk_red.png)
![](i/punkette_light_mohawk_orange.png)
![](i/punkette_light_mohawk_green.png)
![](i/punkette_light_mohawk_blonde.png)
![](i/punkette_light_mohawk_whitesmoke.png)

![](i/punkette_dark_mohawk_black.png)
![](i/punkette_dark_mohawk_brunette.png)
![](i/punkette_dark_mohawk_red.png)
![](i/punkette_dark_mohawk_orange.png)
![](i/punkette_dark_mohawk_green.png)
![](i/punkette_dark_mohawk_blonde.png)
![](i/punkette_dark_mohawk_whitesmoke.png)

![](i/punkette_darker_mohawk_black.png)
![](i/punkette_darker_mohawk_brunette.png)
![](i/punkette_darker_mohawk_red.png)
![](i/punkette_darker_mohawk_orange.png)
![](i/punkette_darker_mohawk_green.png)
![](i/punkette_darker_mohawk_blonde.png)
![](i/punkette_darker_mohawk_whitesmoke.png)

4x

![](i/punkette_lighter_mohawk_blackx4.png)
![](i/punkette_lighter_mohawk_brunettex4.png)
![](i/punkette_lighter_mohawk_redx4.png)
![](i/punkette_lighter_mohawk_orangex4.png)
![](i/punkette_lighter_mohawk_greenx4.png)
![](i/punkette_lighter_mohawk_blondex4.png)
![](i/punkette_lighter_mohawk_whitesmokex4.png)

![](i/punkette_light_mohawk_blackx4.png)
![](i/punkette_light_mohawk_brunettex4.png)
![](i/punkette_light_mohawk_redx4.png)
![](i/punkette_light_mohawk_orangex4.png)
![](i/punkette_light_mohawk_greenx4.png)
![](i/punkette_light_mohawk_blondex4.png)
![](i/punkette_light_mohawk_whitesmokex4.png)

![](i/punkette_dark_mohawk_blackx4.png)
![](i/punkette_dark_mohawk_brunettex4.png)
![](i/punkette_dark_mohawk_redx4.png)
![](i/punkette_dark_mohawk_orangex4.png)
![](i/punkette_dark_mohawk_greenx4.png)
![](i/punkette_dark_mohawk_blondex4.png)
![](i/punkette_dark_mohawk_whitesmokex4.png)

![](i/punkette_darker_mohawk_blackx4.png)
![](i/punkette_darker_mohawk_brunettex4.png)
![](i/punkette_darker_mohawk_redx4.png)
![](i/punkette_darker_mohawk_orangex4.png)
![](i/punkette_darker_mohawk_greenx4.png)
![](i/punkette_darker_mohawk_blondex4.png)
![](i/punkette_darker_mohawk_whitesmokex4.png)



And

``` ruby
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
```

Voila!


![](i/punkette_lighter_bob_black.png)
![](i/punkette_lighter_bob_brunette.png)
![](i/punkette_lighter_bob_red.png)
![](i/punkette_lighter_bob_orange.png)
![](i/punkette_lighter_bob_green.png)
![](i/punkette_lighter_bob_blonde.png)
![](i/punkette_lighter_bob_whitesmoke.png)

![](i/punkette_light_bob_black.png)
![](i/punkette_light_bob_brunette.png)
![](i/punkette_light_bob_red.png)
![](i/punkette_light_bob_orange.png)
![](i/punkette_light_bob_green.png)
![](i/punkette_light_bob_blonde.png)
![](i/punkette_light_bob_whitesmoke.png)

![](i/punkette_dark_bob_black.png)
![](i/punkette_dark_bob_brunette.png)
![](i/punkette_dark_bob_red.png)
![](i/punkette_dark_bob_orange.png)
![](i/punkette_dark_bob_green.png)
![](i/punkette_dark_bob_blonde.png)
![](i/punkette_dark_bob_whitesmoke.png)

![](i/punkette_darker_bob_black.png)
![](i/punkette_darker_bob_brunette.png)
![](i/punkette_darker_bob_red.png)
![](i/punkette_darker_bob_orange.png)
![](i/punkette_darker_bob_green.png)
![](i/punkette_darker_bob_blonde.png)
![](i/punkette_darker_bob_whitesmoke.png)

4x

![](i/punkette_lighter_bob_blackx4.png)
![](i/punkette_lighter_bob_brunettex4.png)
![](i/punkette_lighter_bob_redx4.png)
![](i/punkette_lighter_bob_orangex4.png)
![](i/punkette_lighter_bob_greenx4.png)
![](i/punkette_lighter_bob_blondex4.png)
![](i/punkette_lighter_bob_whitesmokex4.png)

![](i/punkette_light_bob_blackx4.png)
![](i/punkette_light_bob_brunettex4.png)
![](i/punkette_light_bob_redx4.png)
![](i/punkette_light_bob_orangex4.png)
![](i/punkette_light_bob_greenx4.png)
![](i/punkette_light_bob_blondex4.png)
![](i/punkette_light_bob_whitesmokex4.png)

![](i/punkette_dark_bob_blackx4.png)
![](i/punkette_dark_bob_brunettex4.png)
![](i/punkette_dark_bob_redx4.png)
![](i/punkette_dark_bob_orangex4.png)
![](i/punkette_dark_bob_greenx4.png)
![](i/punkette_dark_bob_blondex4.png)
![](i/punkette_dark_bob_whitesmokex4.png)

![](i/punkette_darker_bob_blackx4.png)
![](i/punkette_darker_bob_brunettex4.png)
![](i/punkette_darker_bob_redx4.png)
![](i/punkette_darker_bob_orangex4.png)
![](i/punkette_darker_bob_greenx4.png)
![](i/punkette_darker_bob_blondex4.png)
![](i/punkette_darker_bob_whitesmokex4.png)





And

``` ruby
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
```

![](i/punkette_lighter_clown_black.png)
![](i/punkette_lighter_clown_brunette.png)
![](i/punkette_lighter_clown_red.png)
![](i/punkette_lighter_clown_orange.png)
![](i/punkette_lighter_clown_green.png)
![](i/punkette_lighter_clown_blonde.png)
![](i/punkette_lighter_clown_whitesmoke.png)

![](i/punkette_light_clown_black.png)
![](i/punkette_light_clown_brunette.png)
![](i/punkette_light_clown_red.png)
![](i/punkette_light_clown_orange.png)
![](i/punkette_light_clown_green.png)
![](i/punkette_light_clown_blonde.png)
![](i/punkette_light_clown_whitesmoke.png)

![](i/punkette_dark_clown_black.png)
![](i/punkette_dark_clown_brunette.png)
![](i/punkette_dark_clown_red.png)
![](i/punkette_dark_clown_orange.png)
![](i/punkette_dark_clown_green.png)
![](i/punkette_dark_clown_blonde.png)
![](i/punkette_dark_clown_whitesmoke.png)

![](i/punkette_darker_clown_black.png)
![](i/punkette_darker_clown_brunette.png)
![](i/punkette_darker_clown_red.png)
![](i/punkette_darker_clown_orange.png)
![](i/punkette_darker_clown_green.png)
![](i/punkette_darker_clown_blonde.png)
![](i/punkette_darker_clown_whitesmoke.png)

4x

![](i/punkette_lighter_clown_blackx4.png)
![](i/punkette_lighter_clown_brunettex4.png)
![](i/punkette_lighter_clown_redx4.png)
![](i/punkette_lighter_clown_orangex4.png)
![](i/punkette_lighter_clown_greenx4.png)
![](i/punkette_lighter_clown_blondex4.png)
![](i/punkette_lighter_clown_whitesmokex4.png)

![](i/punkette_light_clown_blackx4.png)
![](i/punkette_light_clown_brunettex4.png)
![](i/punkette_light_clown_redx4.png)
![](i/punkette_light_clown_orangex4.png)
![](i/punkette_light_clown_greenx4.png)
![](i/punkette_light_clown_blondex4.png)
![](i/punkette_light_clown_whitesmokex4.png)

![](i/punkette_dark_clown_blackx4.png)
![](i/punkette_dark_clown_brunettex4.png)
![](i/punkette_dark_clown_redx4.png)
![](i/punkette_dark_clown_orangex4.png)
![](i/punkette_dark_clown_greenx4.png)
![](i/punkette_dark_clown_blondex4.png)
![](i/punkette_dark_clown_whitesmokex4.png)

![](i/punkette_darker_clown_blackx4.png)
![](i/punkette_darker_clown_brunettex4.png)
![](i/punkette_darker_clown_redx4.png)
![](i/punkette_darker_clown_orangex4.png)
![](i/punkette_darker_clown_greenx4.png)
![](i/punkette_darker_clown_blondex4.png)
![](i/punkette_darker_clown_whitesmokex4.png)




And

``` ruby
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
```


![](i/punkette_lighter_straight_black.png)
![](i/punkette_lighter_straight_brunette.png)
![](i/punkette_lighter_straight_red.png)
![](i/punkette_lighter_straight_orange.png)
![](i/punkette_lighter_straight_green.png)
![](i/punkette_lighter_straight_blonde.png)
![](i/punkette_lighter_straight_whitesmoke.png)

![](i/punkette_light_straight_black.png)
![](i/punkette_light_straight_brunette.png)
![](i/punkette_light_straight_red.png)
![](i/punkette_light_straight_orange.png)
![](i/punkette_light_straight_green.png)
![](i/punkette_light_straight_blonde.png)
![](i/punkette_light_straight_whitesmoke.png)

![](i/punkette_dark_straight_black.png)
![](i/punkette_dark_straight_brunette.png)
![](i/punkette_dark_straight_red.png)
![](i/punkette_dark_straight_orange.png)
![](i/punkette_dark_straight_green.png)
![](i/punkette_dark_straight_blonde.png)
![](i/punkette_dark_straight_whitesmoke.png)

![](i/punkette_darker_straight_black.png)
![](i/punkette_darker_straight_brunette.png)
![](i/punkette_darker_straight_red.png)
![](i/punkette_darker_straight_orange.png)
![](i/punkette_darker_straight_green.png)
![](i/punkette_darker_straight_blonde.png)
![](i/punkette_darker_straight_whitesmoke.png)

4x

![](i/punkette_lighter_straight_blackx4.png)
![](i/punkette_lighter_straight_brunettex4.png)
![](i/punkette_lighter_straight_redx4.png)
![](i/punkette_lighter_straight_orangex4.png)
![](i/punkette_lighter_straight_greenx4.png)
![](i/punkette_lighter_straight_blondex4.png)
![](i/punkette_lighter_straight_whitesmokex4.png)

![](i/punkette_light_straight_blackx4.png)
![](i/punkette_light_straight_brunettex4.png)
![](i/punkette_light_straight_redx4.png)
![](i/punkette_light_straight_orangex4.png)
![](i/punkette_light_straight_greenx4.png)
![](i/punkette_light_straight_blondex4.png)
![](i/punkette_light_straight_whitesmokex4.png)

![](i/punkette_dark_straight_blackx4.png)
![](i/punkette_dark_straight_brunettex4.png)
![](i/punkette_dark_straight_redx4.png)
![](i/punkette_dark_straight_orangex4.png)
![](i/punkette_dark_straight_greenx4.png)
![](i/punkette_dark_straight_blondex4.png)
![](i/punkette_dark_straight_whitesmokex4.png)

![](i/punkette_darker_straight_blackx4.png)
![](i/punkette_darker_straight_brunettex4.png)
![](i/punkette_darker_straight_redx4.png)
![](i/punkette_darker_straight_orangex4.png)
![](i/punkette_darker_straight_greenx4.png)
![](i/punkette_darker_straight_blondex4.png)
![](i/punkette_darker_straight_whitesmokex4.png)



And

``` ruby
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
```

![](i/punkette_lighter_pigtails_black.png)
![](i/punkette_lighter_pigtails_brunette.png)
![](i/punkette_lighter_pigtails_red.png)
![](i/punkette_lighter_pigtails_orange.png)
![](i/punkette_lighter_pigtails_green.png)
![](i/punkette_lighter_pigtails_blonde.png)
![](i/punkette_lighter_pigtails_whitesmoke.png)

![](i/punkette_light_pigtails_black.png)
![](i/punkette_light_pigtails_brunette.png)
![](i/punkette_light_pigtails_red.png)
![](i/punkette_light_pigtails_orange.png)
![](i/punkette_light_pigtails_green.png)
![](i/punkette_light_pigtails_blonde.png)
![](i/punkette_light_pigtails_whitesmoke.png)

![](i/punkette_dark_pigtails_black.png)
![](i/punkette_dark_pigtails_brunette.png)
![](i/punkette_dark_pigtails_red.png)
![](i/punkette_dark_pigtails_orange.png)
![](i/punkette_dark_pigtails_green.png)
![](i/punkette_dark_pigtails_blonde.png)
![](i/punkette_dark_pigtails_whitesmoke.png)

![](i/punkette_darker_pigtails_black.png)
![](i/punkette_darker_pigtails_brunette.png)
![](i/punkette_darker_pigtails_red.png)
![](i/punkette_darker_pigtails_orange.png)
![](i/punkette_darker_pigtails_green.png)
![](i/punkette_darker_pigtails_blonde.png)
![](i/punkette_darker_pigtails_whitesmoke.png)

4x

![](i/punkette_lighter_pigtails_blackx4.png)
![](i/punkette_lighter_pigtails_brunettex4.png)
![](i/punkette_lighter_pigtails_redx4.png)
![](i/punkette_lighter_pigtails_orangex4.png)
![](i/punkette_lighter_pigtails_greenx4.png)
![](i/punkette_lighter_pigtails_blondex4.png)
![](i/punkette_lighter_pigtails_whitesmokex4.png)

![](i/punkette_light_pigtails_blackx4.png)
![](i/punkette_light_pigtails_brunettex4.png)
![](i/punkette_light_pigtails_redx4.png)
![](i/punkette_light_pigtails_orangex4.png)
![](i/punkette_light_pigtails_greenx4.png)
![](i/punkette_light_pigtails_blondex4.png)
![](i/punkette_light_pigtails_whitesmokex4.png)

![](i/punkette_dark_pigtails_blackx4.png)
![](i/punkette_dark_pigtails_brunettex4.png)
![](i/punkette_dark_pigtails_redx4.png)
![](i/punkette_dark_pigtails_orangex4.png)
![](i/punkette_dark_pigtails_greenx4.png)
![](i/punkette_dark_pigtails_blondex4.png)
![](i/punkette_dark_pigtails_whitesmokex4.png)

![](i/punkette_darker_pigtails_blackx4.png)
![](i/punkette_darker_pigtails_brunettex4.png)
![](i/punkette_darker_pigtails_redx4.png)
![](i/punkette_darker_pigtails_orangex4.png)
![](i/punkette_darker_pigtails_greenx4.png)
![](i/punkette_darker_pigtails_blondex4.png)
![](i/punkette_darker_pigtails_whitesmokex4.png)






That's it. Now it's your turn. Yes, you can!
Use your own hair style and color.
