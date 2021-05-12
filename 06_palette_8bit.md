# Christie's Nine Colored in Black 'n' White, Ye Olde' Sepia Tone, Blue or Futuristic False 8-Bit Color Palette - Free Downloads - Right-Click and Save Image


> For the first time, 5,184 pixels' worth of a revolutionary non-fungible token project will go up for auction
> at a traditional auction house, courtesy of the project creators and pioneers [- Matt Hall and John Watkinson, founders of New York-based software company Larva Labs -] themselves.
>
> [...]
>
>  The CryptoPunks are a collection of 24x24, 8-bit-style pixel art images of misfits and eccentrics.
>  There are exactly 10,000 of them, each with their own ostensible personality
>  and unique combination of distinctive, randomly generated features.
>
> [...]
>
> As of early April 2021, over 8,000 sales had been recorded in the previous 12 months,
> with an average sale price of 15.45 ether ($30,412.40).
> The total value of all sales is 127,360 ether ($251,620,000) - and that value grows daily.
>
> In February, CryptoPunk #6965, a fedora-wearing ape Punk, sold for 800 ether - equivalent to $1.5 million.
> And on 11 March 2021, CryptoPunk #7804, the previously mentioned pipe-smoking "wise alien,"
> was sold for the equivalent of $7.5 million - the highest amount ever paid for a Punk at the time.
>
> [...]
>
> Larva Labs' set comprises nine CryptoPunks [[#2](https://www.larvalabs.com/cryptopunks/details/2),
> [#532](https://www.larvalabs.com/cryptopunks/details/532),
> [#58](https://www.larvalabs.com/cryptopunks/details/58),
> [#30](https://www.larvalabs.com/cryptopunks/details/30),
> [#635](https://www.larvalabs.com/cryptopunks/details/635),
> [#602](https://www.larvalabs.com/cryptopunks/details/602),
> [#768](https://www.larvalabs.com/cryptopunks/details/768),
> [#603](https://www.larvalabs.com/cryptopunks/details/603),
> [#757](https://www.larvalabs.com/cryptopunks/details/757)], all from their original collection [24 x 24 pixels each],
> in a single lot that highlights the series' best features: muttonchops, earrings, big shades, crazy hair, a hoodie, a mohawk and more.
> [...]
> Estimate: $7,000,000-9,000,0000.
>  Offered in 21st Century Evening Sale on 13 May at Christie's in New York.
>
>  --[**10 things to know about CryptoPunks, the original Non-Fungible Tokens (NFTs)**](https://www.christies.com/features/10-things-to-know-about-CryptoPunks-11569-1.aspx), Christie's, April 2021


Sold? What's your bid?  Be bold. Come on now. No regrets!


Let's have a closer looksie at
the Christie's Nine line-up
in the original Larva Labs 24 x 24 pixel design series.
Let's mint a fresh copy:


``` ruby
require 'cryptopunks'

punks = Punks::Image.read( './punks.png' )

ids = [2, 532, 58, 30, 635, 602, 768, 603, 757]
ids.each do |id|
  name = '%04d' % id
  punks[id].save( "./punk-#{name}.png" )
end
```

Voila!

![](i/punk-0002.png)
![](i/punk-0532.png)
![](i/punk-0058.png)
![](i/punk-0030.png)
![](i/punk-0635.png)
![](i/punk-0602.png)
![](i/punk-0768.png)
![](i/punk-0603.png)
![](i/punk-0757.png)


Can you spot the super rare alien?


Punk Philosophy Aside: Two New York hipsters auction off million dollar 24 x 24 pixel art. Is that punk?!  Or a cash grab of greedy fraudsters?



Whatever. Fuck the establishment.
Let's generate some freebie punks.


Let's change the color to black & white or
more scientifically known as 8-bit grayscale, that is,
256 shades of gray
starting with black (`0x000000`)
and ending with white (`0xffffff`).


![](i/palette_grayscale.png)


Let's try the magic `grayscale` method:

``` ruby
require 'pixelart'

ids.each do |id|
  name = '%04d' % id
  punk = Image.read( "./punk-#{name}.png" )

  punk_bw = punk.grayscale
  punk_bw.save( "./punk-#{name}_bw.png" )
  punk_bw.scale( 4 ).save( "./punk-#{name}_bw4x.png" )
end
```


Voila! The Black & White Series.

![](i/punk-0002_bw.png)
![](i/punk-0532_bw.png)
![](i/punk-0058_bw.png)
![](i/punk-0030_bw.png)
![](i/punk-0635_bw.png)
![](i/punk-0602_bw.png)
![](i/punk-0768_bw.png)
![](i/punk-0603_bw.png)
![](i/punk-0757_bw.png)

![](i/punk-0002_bw4x.png)
![](i/punk-0532_bw4x.png)
![](i/punk-0058_bw4x.png)
![](i/punk-0030_bw4x.png)
![](i/punk-0635_bw4x.png)
![](i/punk-0602_bw4x.png)
![](i/punk-0768_bw4x.png)
![](i/punk-0603_bw4x.png)
![](i/punk-0757_bw4x.png)



How does the black & white magic work?
Let's look at the colors
of punk #2 before and after
using the `show_colors` helper
that gathers and prints the insider pixel statistics:


``` ruby
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
```

Let's try:

```ruby
punk = Image.read( "./punk-0002.png" )
puts "before:"
show_colors( punk )

punk_bw = punk.grayscale
puts "after:"
show_colors( punk_bw )
```

resulting in:

```
6 color(s):
  [0]  326 pixel(s) - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  [1]  165 pixel(s) - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
  [2]   76 pixel(s) - #dbb180 / rgb(219 177 128) - hsl( 32°  56%  68%)
  [3]    4 pixel(s) - #a66e2c / rgb(166 110  44) - hsl( 32°  58%  41%)
  [4]    2 pixel(s) - #d29d60 / rgb(210 157  96) - hsl( 32°  56%  60%)
  [5]    3 pixel(s) - #711010 / rgb(113  16  16) - hsl(  0°  75%  25%)
```

and

```
6 color(s):
  [0]  326 pixel(s) - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  [1]  165 pixel(s) - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
  [2]   76 pixel(s) - #b8b8b8 / rgb(184 184 184) - hsl(  0°   0%  72%)           - 8-BIT GRAYSCALE #184
  [3]    4 pixel(s) - #787878 / rgb(120 120 120) - hsl(  0°   0%  47%)           - 8-BIT GRAYSCALE #120
  [4]    2 pixel(s) - #a6a6a6 / rgb(166 166 166) - hsl(  0°   0%  65%)           - 8-BIT GRAYSCALE #166
  [5]    3 pixel(s) - #2d2d2d / rgb( 45  45  45) - hsl(  0°   0%  18%)           - 8-BIT GRAYSCALE #45
```

See the black & white difference?
In the rgb (red/green/blue) color scheme
all colors are now between
`rgb(0 0 0)` and `rgb(255 255 255)` with
every rgb triplet having equal values
and in the hsl (hue/saturation/lightness) color scheme
the hue is now always 0° degree
and the saturation is 0% resulting in
8-bit grayscale, that is,
256 shades of gray
starting with black (`0x000000`)
and ending with white (`0xffffff`).


Now having an 8-bit color palette, that is 256 colors
from 0 to 255 lets us
swap the colors with different 8-bit color palettes.
Let's start with the ye olde' sepia
that is in the real world a chemical process
but in the digital a special effect for
an old fashioned and aged vintage foto look.


![](i/palette_sepia.png)


Let's try:

``` ruby
ids.each do |id|
  name = '%04d' % id
  punk = Image.read( "./punk-#{name}.png" )

  punk_sepia = punk.change_palette8bit( Palette8bit::SEPIA )
  punk_sepia.save( "./punk-#{name}_sepia.png" )
  punk_sepia.scale( 4 ).save( "./punk-#{name}_sepia4x.png" )
end
```


Voila! The Ye Olde' Sepia Vintage Series.

![](i/punk-0002_sepia.png)
![](i/punk-0532_sepia.png)
![](i/punk-0058_sepia.png)
![](i/punk-0030_sepia.png)
![](i/punk-0635_sepia.png)
![](i/punk-0602_sepia.png)
![](i/punk-0768_sepia.png)
![](i/punk-0603_sepia.png)
![](i/punk-0757_sepia.png)

![](i/punk-0002_sepia4x.png)
![](i/punk-0532_sepia4x.png)
![](i/punk-0058_sepia4x.png)
![](i/punk-0030_sepia4x.png)
![](i/punk-0635_sepia4x.png)
![](i/punk-0602_sepia4x.png)
![](i/punk-0768_sepia4x.png)
![](i/punk-0603_sepia4x.png)
![](i/punk-0757_sepia4x.png)




What's next? Let's bring back colors!

![](i/palette_blue.png)

Let's try a blue theme:

``` ruby
ids.each do |id|
  name = '%04d' % id
  punk = Image.read( "./punk-#{name}.png" )

  punk_blue = punk.change_palette8bit( Palette8bit::BLUE )
  punk_blue.save( "./punk-#{name}_blue.png" )
  punk_blue.scale( 4 ).save( "./punk-#{name}_blue4x.png" )
end
```


Voila! The Blue Series.

![](i/punk-0002_blue.png)
![](i/punk-0532_blue.png)
![](i/punk-0058_blue.png)
![](i/punk-0030_blue.png)
![](i/punk-0635_blue.png)
![](i/punk-0602_blue.png)
![](i/punk-0768_blue.png)
![](i/punk-0603_blue.png)
![](i/punk-0757_blue.png)

![](i/punk-0002_blue4x.png)
![](i/punk-0532_blue4x.png)
![](i/punk-0058_blue4x.png)
![](i/punk-0030_blue4x.png)
![](i/punk-0635_blue4x.png)
![](i/punk-0602_blue4x.png)
![](i/punk-0768_blue4x.png)
![](i/punk-0603_blue4x.png)
![](i/punk-0757_blue4x.png)



And to wrap up let's go futuristic.

![](i/palette_false.png)


Let's try a false color palette:

``` ruby
ids.each do |id|
  name = '%04d' % id
  punk = Image.read( "./punk-#{name}.png" )

  punk_false = punk.change_palette8bit( Palette8bit::FALSE )
  punk_false.save( "./punk-#{name}_false.png" )
  punk_false.scale( 4 ).save( "./punk-#{name}_false4x.png" )
end
```

Voila! The Futuristic False Color Series.

![](i/punk-0002_false.png)
![](i/punk-0532_false.png)
![](i/punk-0058_false.png)
![](i/punk-0030_false.png)
![](i/punk-0635_false.png)
![](i/punk-0602_false.png)
![](i/punk-0768_false.png)
![](i/punk-0603_false.png)
![](i/punk-0757_false.png)

![](i/punk-0002_false4x.png)
![](i/punk-0532_false4x.png)
![](i/punk-0058_false4x.png)
![](i/punk-0030_false4x.png)
![](i/punk-0635_false4x.png)
![](i/punk-0602_false4x.png)
![](i/punk-0768_false4x.png)
![](i/punk-0603_false4x.png)
![](i/punk-0757_false4x.png)



Now do-it-yourself (DIY) and generate your own punk series
in your own colors! Yes, you can!



