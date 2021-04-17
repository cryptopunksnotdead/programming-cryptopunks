# Free Downloads - Christie's Nine Colored in Black 'n' White, Ye Olde' Sepia Tone, Blue or Futuristic False 8-Bit Color Palette - Right-Click and Save Image


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




Let's mint Christie's Nine line-up
in the original Larva Labs 24 x 24 pixel series design:


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


Let's change the color to black and white or
more scientifically known as 8-bit grayscale, that is,
256 shades of gray (incl. black and white).


![](i/palette_grayscale)


Let's try:

``` ruby
require 'pixelart'

ids = [2, 532, 58, 30, 635, 602, 768, 603, 757]
ids.each do |id|
  name = '%04d' % id
  punk = Pixelart::Image.read( "./punk-#{name}.png" )

  punk_bw = punk.grayscale
  punk_bw.save( "./punk-#{name}_bw.png" )
  punk_bw.scale( 4 ).save( "./punk-#{name}_bw4x.png" )
end
```


Voila!

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



How does the black and white magic work?













Now do-it-yourself (DIY) and generate your own punk series
in your own colors! Yes, you can!



