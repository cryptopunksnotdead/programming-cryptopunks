# Revolutionize the Digital Art Market - Fractionalize The World's First Billion Dollar Pixel Image - Build Your Own All-In-One Composites / Collections Picking Your Punks of Choice Ready to Sell Off to New Owners




## The World's First Billion Dollar Pixel Image

Inspired by the composite image (2400×2400) that holds all 10 000 cryptopunks
in the original 24×24 design -  currently (as of March 2021) estimated
at around $2 000 million (yes, that is, $2 billion)
according to the [Institute For the Future (IFF) at the University of Nicosia](https://nftvaluations.com/cryptopunks) "scientific" valuation formula:

![](https://github.com/cryptopunksnotdead/awesome-cryptopunks-bubble/raw/master/i/punks-zoom.png)


Let's put together new all-in-one composites that break up
the 10 000 cryptopunks monster into smaller
curated collections ready to sell off to new owners
(or is that fools?).



## Step 1 -  Read True Official Genuine CryptoPunks™ composite image


``` ruby
require 'cryptopunks'

punks = Punks::Image::Composite.read( './punks.png' )
```



## Alien Millionaire's Row - Diamond Elite Circle

Let's start with the smallest and most elite batch
featuring an exclusive set of all nine aliens.


Read in the datasets holding all the metadata for all 10 000 punks:

``` ruby
recs = Punks::Dataset.read( './punks/*.csv' )
recs.size
#=> 10000
```

And find all alien records:

``` ruby
aliens = recs.select {|rec| rec.alien? }
aliens.size
#=> 9
```

Let's put the nine aliens in a quadratic 3x3 composite:

``` ruby
composite = Punks::Image::Composite.new( 3, 3 )
aliens.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( 'aliens.png' )
```

Voila!

![](i/aliens.png)




## Planet of the Apes - Platium Elite Circle

Let's try a bigger batch
featuring an exclusive set of all twenty-four apes.

Find all ape records:

``` ruby
apes = recs.select {|rec| rec.apes? }
apes.size
#=> 24
```

Let's put the twenty-four apes in a 4x6 composite:

``` ruby
composite = Punks::Image::Composite.new( 4, 6 )
apes.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( 'apes.png' )
```

Voila!

![](i/apes.png)




## CryptoZombies, the Punk Edition

Let's try an exclusive set featuring all zombies
or is that CryptoZombies?

Find all zombie records:

``` ruby
zombies = recs.select {|rec| rec.zombie? }
zombies.size
#=> 88
```

Let's put the eighty-eight zombies in a 8x11 composite:

``` ruby
composite = Punks::Image::Composite.new( 8, 11 )
zombies.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( 'zombies.png' )
```

Voila!

![](i/zombies.png)







Yes, you can!  Now curate your own composite (or is that collection?)
ready to sell off to new owners.
