# Nine Super Rare Aliens (in Cyan)? Start the Alien Invasion from Mars - Mint Little 24×24 Extraterrestrials (E.T.s) in Green, Chartreuse, Yellow, Orange, Red, Fuchsia, or Magenta


Crypto collectibles are all about rarity - the more rare the punk type the more valuable the 24×24 pixel art in theory.

Let's check if the theory holds up. Only nine super rare aliens
in cyan color exist on earth
out of a total collection of 10 000
[with a certificate of ownership in the `CryptoPunksMarket` blockchain contract state storage].

Let's mint the alien line-up:


``` ruby
require 'cryptopunks'

punks = Punks::Image.read( './punks.png' )

ids = [635, 2890, 3100, 3443, 5822, 5905, 6089, 7523, 7804]
ids.each do |id|
  name = '%04d' % id
  punks[id].save( "./punk-#{name}.png" )
end
```

Voila!

![](i/punk-0635.png)
![](i/punk-2890.png)
![](i/punk-3100.png)
![](i/punk-3443.png)
![](i/punk-5822.png)
![](i/punk-5905.png)
![](i/punk-6089.png)
![](i/punk-7523.png)
![](i/punk-7804.png)


What's your favorite? What's your offer bid?


The highest ever punk price, that is, $7.5 millions
as of March 11, 2021 - goes to...


Yes, it's punk ![](i/punk-3100.png) [#3100](https://www.larvalabs.com/cryptopunks/details/3100) - the blue-white headband wearing alien
in cyan color.



In cyan color? Let's look at all the colors in use in the
24×24 pixel art.

``` ruby
require 'pixelart'

punk = Pixelart::Image.read( './punk-3100.png' )
punk.pixels.count         # total pixels - 24×24
#=>  516
punk.pixels.uniq.count    # total colors - unique colored pixels
#=>  7
```

And let's print the seven colors:

``` ruby
punk.pixels.uniq
#=> [0, 255, 3371957247, 4294967295, 443471359, 1975369215, 2615206143]
```

Okkie?
Let's convert to the standard rgb - red/green/blue -
and hsl - hue/saturation/lightness color schemes
with alpha channel (for transparency):

``` ruby
punks.pixels.uniq.each_with_index do |color, i|
  hex = Pixelart::Color.to_hex( color )   # rgba in hex (string format)
  hsl = Pixelart::Color.to_hsl( color )
  print "[#{i}]  "
  print hex
  print "  "
  print   hsl.inspect
  print "\n"
end
```

resulting in:

```
[0]  #00000000  [  0, 0.0,  0.0,    0]
[1]  #000000ff  [  0, 0.0,  0.0,  255]
[2]  #c8fbfbff  [180, 0.86, 0.88, 255]
[3]  #ffffffff  [  0, 0.0,  1.0,  255]
[4]  #1a6ed5ff  [213, 0.78, 0.46, 255]
[5]  #75bdbdff  [180, 0.35, 0.6,  255]
[6]  #9be0e0ff  [180, 0.52, 0.74, 255]
```

The color 0, that is, `#00000000` is the transparent color -
the fourth elment in rgba `00` or hsla `0` is the alpha channel - the opacity from
`0` (fully transparent) to `255` (fully opaque).

The color 1, that is, `#000000ff` is black -
it's `#00 00 00` or `rgb(0,0,0)`
with the alpha channel set to `ff` (fully opaque)
or `rgba(0,0,0,255)`.

The color 3, that is, `#ffffffff` is white -
it's `#ff ff ff` or `rgb(255,255,255)`
with the alpha channel set to `ff` (fully opaque)
or `rgba(255,255,255,255)`.


That finally gets us to the three colors with
a hue of 180° degrees on the hsl color wheel -
the main colors for aliens:

```
[2]  #c8fbfbff  [180, 0.86, 0.88, 255]
[5]  #75bdbdff  [180, 0.35, 0.6,  255]
[6]  #9be0e0ff  [180, 0.52, 0.74, 255]
```

If you look up 180° -
that's cyan (a greenish-blue) primary color.


So what?  Let's start
the alien invasion from mars.
Let's mint little 24×24 extraterrestrials (E.T.s)
in  green (120°), chartreuse (90°), yellow (60°),
orange (30°), red (0°), fuchsia (°330), and, magenta (°300).


``` ruby
ids = [635, 2890, 3100, 3443, 5822, 5905, 6089, 7523, 7804]
ids.each do |id|
  name = '%04d' % id
  punk = Pixelart::Image.read( "./punk-#{name}.png" )

  [180, 150, 120, 90, 60, 30, 0, 330, 300].each do |hue|
     saturation =  0.13
     lightness  = -0.30
     color_map = {
      '#c8fbfbff' => [hue, 0.86+saturation, 0.88+lightness],
      '#75bdbdff' => [hue, 0.35+saturation, 0.60+lightness],
      '#9be0e0ff' => [hue, 0.52+saturation, 0.74+lightness],
     }

     new_punk = punk.change_colors( color_map )
     new_punk.save( "./punk-#{name}_#{hue}.png")
  end
end
```

Note: To make the colors a little more "intense"
let's turn up the saturation by `13%` (that is, `0.13`)
and darken (turn down) the lightness by `30%` (that is, `-0.30`).

Voila! The alien invasion army!


![](i/punk-0635_180.png)
![](i/punk-2890_180.png)
![](i/punk-3100_180.png)
![](i/punk-3443_180.png)
![](i/punk-5822_180.png)
![](i/punk-5905_180.png)
![](i/punk-6089_180.png)
![](i/punk-7523_180.png)
![](i/punk-7804_180.png)

![](i/punk-0635_150.png)
![](i/punk-2890_150.png)
![](i/punk-3100_150.png)
![](i/punk-3443_150.png)
![](i/punk-5822_150.png)
![](i/punk-5905_150.png)
![](i/punk-6089_150.png)
![](i/punk-7523_150.png)
![](i/punk-7804_150.png)

![](i/punk-0635_120.png)
![](i/punk-2890_120.png)
![](i/punk-3100_120.png)
![](i/punk-3443_120.png)
![](i/punk-5822_120.png)
![](i/punk-5905_120.png)
![](i/punk-6089_120.png)
![](i/punk-7523_120.png)
![](i/punk-7804_120.png)

![](i/punk-0635_90.png)
![](i/punk-2890_90.png)
![](i/punk-3100_90.png)
![](i/punk-3443_90.png)
![](i/punk-5822_90.png)
![](i/punk-5905_90.png)
![](i/punk-6089_90.png)
![](i/punk-7523_90.png)
![](i/punk-7804_90.png)

![](i/punk-0635_60.png)
![](i/punk-2890_60.png)
![](i/punk-3100_60.png)
![](i/punk-3443_60.png)
![](i/punk-5822_60.png)
![](i/punk-5905_60.png)
![](i/punk-6089_60.png)
![](i/punk-7523_60.png)
![](i/punk-7804_60.png)

![](i/punk-0635_30.png)
![](i/punk-2890_30.png)
![](i/punk-3100_30.png)
![](i/punk-3443_30.png)
![](i/punk-5822_30.png)
![](i/punk-5905_30.png)
![](i/punk-6089_30.png)
![](i/punk-7523_30.png)
![](i/punk-7804_30.png)

![](i/punk-0635_0.png)
![](i/punk-2890_0.png)
![](i/punk-3100_0.png)
![](i/punk-3443_0.png)
![](i/punk-5822_0.png)
![](i/punk-5905_0.png)
![](i/punk-6089_0.png)
![](i/punk-7523_0.png)
![](i/punk-7804_0.png)

![](i/punk-0635_330.png)
![](i/punk-2890_330.png)
![](i/punk-3100_330.png)
![](i/punk-3443_330.png)
![](i/punk-5822_330.png)
![](i/punk-5905_330.png)
![](i/punk-6089_330.png)
![](i/punk-7523_330.png)
![](i/punk-7804_330.png)

![](i/punk-0635_300.png)
![](i/punk-2890_300.png)
![](i/punk-3100_300.png)
![](i/punk-3443_300.png)
![](i/punk-5822_300.png)
![](i/punk-5905_300.png)
![](i/punk-6089_300.png)
![](i/punk-7523_300.png)
![](i/punk-7804_300.png)



What's your favorite color? What's your offer bid?
(Hint: Right-click and download the 24×24 pixel art image for free).



Now ask yourself - if you can mint any alien in any color for free anytime - what's your price target for
the "super rare"
 blue-white headband wearing alien ![](i/punk-3100.png)
in cyan color for 2022?  Is it zero or ten millions?



