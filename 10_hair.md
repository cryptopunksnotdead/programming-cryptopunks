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
    punkette.save( "./i/punkette_#{name}.png" )
    punkette.zoom(4).save( "./i/punkette_#{name}x4.png" )
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



