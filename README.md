
Note: See [**/punks.whitelabel**](https://github.com/cryptopunksnotdead/punks.whitelabel) -
The Free White Label Punk Quick Starter Edition - if you want to (re)create from zero / scratch a pixel-perfect copy of the 10 000 Matt & John's® punks collection (anno 2017).

---

Crypto Collectibles Series -
[Cats](https://github.com/cryptocopycats/programming-mooncats) ·
[Kitties](https://github.com/cryptocopycats/programming-cryptokitties) ·
[Punks](https://github.com/cryptopunksnotdead/programming-cryptopunks) ·
[(Modern Art) Spot Paintings](https://github.com/currencyart/currencyart-howto)



# Programming (Crypto) Pixel Punk Profile Pictures & (Generative) Art - Step-by-Step Book / Guide

_Inside Unique 24×24 Pixel Art on (and off) the Blockchain..._

by [Gerald Bauer](https://github.com/geraldb), et al

- [Do-It-Yourself (DIY) - Yes, You Can! - Crop & Save Your Own Punks in Original 24x24 Pixel Format or With 2X / 4X / 8X Zoom](01_crop.md)
- [Statistics, Statistics, Statistics - Calculate Rarity & Popularity By Type, By Accessories, & More - Inside the Matt & John's® 10 000 Punks Population](02_attributes.md)
- [Inside the Punk Art Machinery - How To Generate 10 000 Punks (and Punkettes), Algorithmically - Paint by Numbers](03_generate.md)
- [10 000 More Punks - Inside the Punk Art Machinery (Continued) - How To Generate Punks, Algorithmically - Paint by Numbers - A New Punk Series](04_generate_ii.md)
- [Nine Super Rare Aliens (in Cyan)? Start the Alien Invasion from Mars - Generate Little 24×24 Extraterrestrials (E.T.s) in Green, Chartreuse, Yellow, Orange, Red, Fuchsia, or Magenta](05_alien_invasion.md)
- [Christie's Nine Colored in Black 'n' White, Ye Olde' Sepia Tone, Blue or Futuristic False 8-Bit Color Palette - Free Downloads - Right-Click and Save Image](06_palette_8bit.md)
- [United Colors of Humanity - Light, Lighter, Dark, Darker - How To Change Skin Tones](07_humans.md)
- [Revolutionize the Digital Art Market - Fractionalize The World's First Billion Dollar Pixel Image - Build Your Own All-In-One Punk Composites - Curate Your Own Exclusive Collections Ready to Sell Off to New Owners](08_composite.md)
- [Inside the $7.5 Million "Mr Mona Lisa" Punk - Deconstructing the 24x24 Pixel Art and Reconstructing with a Smile in a "Mr & Mrs Mona Lisa" Left and Right Edition](09_monalisa.md)
- [7 Quick & Easy Hairstyles with Simple Instructions to Do in a Few Minutes - Trendy Ideas for Punkettes to Try in 2021 - Is Orange the New Black?](10_hair.md)


To be continued...


- [Appendix - Pixel Art Special Effects Gallery / Cheatsheet - Free Ideas & Recipes for Starting Your Own CryptoPunks Collection Today](A1_special_effects.md)





## Frequently Asked Questions (F.A.Q.) and Answers

### Troubleshooting - Running the (Ruby) Sample Code / Scripts

Q:  I try to run a script and I get an **"cannot load such file -- pixelart (LoadError)"**.
Could somebody please help me out getting the script to run?

A:  The **"cannot load such file -- pixelart (LoadError)"**
error tells you that you need to install the [pixelart package](https://rubygems.org/gems/pixelart) called gems in rubyland.

Try:

     $ gem install pixelart

To check all gems (ruby packages) that you have installed locally try:

     $ gem list

Now retry running your (ruby) script



## Pixel Art Programming


### **Q**: How can I generate 10 000 (bored) ape images in 800x800px from the all-in-one composite image in the 50x50 format?

An answer to the question in [**10 000 Basic Bored Apes Club (50×50) - Free All-In-One Image Composite Download (5000×5000px) - basicboredapeclub.png (~2MB)**](https://old.reddit.com/r/CryptoPunksDev/comments/sbpduc/10_000_basic_bored_apes_club_50x50_free_allinone/):

The bored ape (tiles) in the composite image are in 50×50px. To get to 800×800px use a 16x zoom (50px × 16 = 800px). Try:

``` ruby
require 'pixelart'

# step 1: read in all-in-one ape image composite
apes = ImageComposite.read( "basicboredapes50x50.png", width: 50, height: 50 )

# step 2: loop over all apes and save one-by-one w/ 16x zoom
apes.each_with_index do |ape,i|
  ape.zoom(16).save( "ape-#{i}.png")
end
```


### **Q**: When generating 10 000 (bored) apes from the all-in-one composite image is there an (automagic) way to remove the background / make the background transparent before saving the images?

The image class in the pixelart library / gem / package includes a `Image#transparent` method that tries to remove the background - that is - turning the background color(s) into the transparent color (0).

Note - The [**Image#transparent machinery**](https://github.com/pixelartexchange/pixelart/blob/master/pixelart/lib/pixelart/transparent.rb) is NOT using a neural network or such but for now a simple algorithm that may or may not work for different images - in the simple case it will take the color of the pixel at the x/y-coord 0/0 and will turn all pixels with that color into transparent (0) - thus - removing the background (if it is a single solid color).

Now try and change

``` ruby
ape.zoom(16).save( "ape-#{i}.png")
```

to

``` ruby
ape.transparent.zoom(16).save( "ape-#{i}.png")
```

and see if the "magic" works.



### **Q**: How can I generate 10 000 left-looking p(h)unks in any size (2x, 4x, 8x, etc.) individually, that is, one-by-one?

See [**Free Phunks Composite Download (~800k) - Get All 10 000 Left-Looking ("Mirrored") CryptoPunks In An All-In-One Image (2400×2400)**](https://old.reddit.com/r/CryptoPunksDev/comments/orv98e/free_phunks_composite_download_800k_get_all_10/)
for a start and change the loop in the [**phunks script**](https://github.com/cryptopunksnotdead/cryptopunks/blob/master/phunks/phunks.rb) from

``` ruby
punks.each do |punk|
  phunks << punk.mirror    #¹
end
```

to save the phunks one-by-one in 24×24 and in 192×192 (with 8x zoom) try:

``` ruby
punks.each_with_index do |punk,i|
  phunk = punk.mirror
  phunk.save( "phunk-#{i}.png" )
  phunk.zoom(8).save( "phunk-#{i}@8x.png" )

  phunks << phunk  ## add to composite
end
```

(Re)run the script and voila - you will get 20 000 phunk images in two series in the 24x24 and 192x192 (with 8x zoom) format e.g.  `phunk-0.png`, `phunk-0@8x.png`, `phunk-1.png`, `phunk-1@8x.png`, and so on.

1:  The `Image#mirror` method flips the image vertically (right-facing to left-facing).

<!--
https://old.reddit.com/r/CryptoPunksDev/comments/s4hyny/q_how_can_i_generate_10_000_leftlooking_phunks_in/
-->


### Q: Is there a way to specify the tile width and height for ImageComposite (rather that the default 24 pixels)?

Yes, you can pass along the width and height (as optional) keyword arguments e.g.

``` ruby
ImageComposite.new( 3, 2,  width: 32, height: 32 )   # 3×2 grid with 32×32px tiles
```

<!--
https://old.reddit.com/r/CryptoPunksDev/comments/rzqipr/compositeimage_from_pixelart/
-->




## Legal & Financial (Con-Art) Fraud

### Q: Am I allowed to create and sell my own [crypto] punk (pixel) characters / heads? Are punk (pixel) characters / heads (in 24x24) copyrightable?

**A:** I am not a lawyer but let's get real. Yes, in a free world you can of course create and sell your own punks.

About the originals by the LarvaLabs bros - Matt Hall & John Watkinson  - the first question to ask: Are they really original?  See the [**Blockheads (Anno 2013)**](https://github.com/pixelartexchange/pixelart-howto/tree/master/blockheads) and I am sure there are many more.

I'd say you cannot copyright a trivial 24×24 pixel image - there might be a point about the complete collection (like you can copyright a complete database but not individual facts).

Thanks to and courtesy of Hemba the Anonymous Matt & John's® Punks V1 "Founder" / Head an
actual statement from intellectual property (or is that monopoly rights) attorneys from Los Angeles:

> In creating the [Matt & John's®] punks, Larva Labs' [Matt Hall & John Watkinson] established 98 individual graphic elements in 8-bit-style pixel art [in a 24x24 canvas]. Then they ran a software program to randomly generate the images that would become the individual [Matt & John's®] punks. Each punk is just a machine-generated amalgamation of certain individual elements. Few, if any, of the individual pixel art elements contain sufficient creative expression to qualify as being copyrightable. Randomly mixing uncopyrightable elements does not necessarily create copyrightable expression, particularly without human involvement.
>
>  (Source: [Punks v1 Legal Position, A Document Prepared By Attorneys in Los Angeles](https://v1punks.gitbook.io/cryptopunks-v1-wiki/cryptopunks-v1-legal-position))

The attorneys continue:

> Are Matt & John's® punks copyrighted [or in the public domain]? It's an open question -
> one that probably would require a court to decide. [...]
> Larva/Yuga Labs probably don't want a court making that determination for them.




Anyways, the irony is of course the name, that is, Crypto Punks.

The punk ethos is that you do-it-yourself and you don't care what others think (oh, that looks so cheap and so on).  And crypto - of course - is by definition a law-less "decentralised" fraudster paradise where anything goes. And yes, selling 24×24 pixel images by itself is a fraud and shame on the LarvaLabs fraudsters¹ for not stopping the madness but raking in the millions $$$ from greater fools.

¹: Please remember - a (blockchain) token - is nothing special - it is a database entry updated (secured) by signed transactions. Yes, the emperor has no clothes. See [**Come See My Collection**](https://www.ic.unicamp.br/~stolfi/bitcoin/2021-04-02-come-see-my-collection.html)  from a more honest computer scientist  - shame on Matt Hall and John Watkinson both have computer science university degrees so the crypto bros for sure know what they are doing and how a database works - or a con-art (blockchain) token scam / fraud.

<!--
comments_url: https://old.reddit.com/r/CryptoPunksDev/comments/pjl8vw/am_i_allowed_to_create_and_sell_my_own_cryptopunks/
-->

### Q: Are only the V2 [Crypto] Punks the "Official" [Crypto] Punks? What about V1? Or More Punks? Or Phunks? Or X Punks? Or Wunks? Or Bunks? Or Zunks?

**A:**   Public Service Announcement - Yes, all punks are good punks -  even if the Larva Labs crypto bros / fraudsters claim
only its own exclusive (token) collection is "official" punk.

On January 25th, 2022 the Larva Labs crypto bros / fraudsters - Matt Hall and John Watkinson -  posted:

> Public Service [Self-Enrichment] Announcement: CryptoPunks V1.0 are not official
> Cryptopunks. We don't like them [anymore], and we've got 1,000 of
> them [to dump] ... so draw your own conclusions.
> Any proceeds [of the sell-off] will be used to purchase [and pump up the] real Cryptopunks [V2.0]!
>
> -- [Larva Labs Crypto Bros / Fraudsters News](https://twitter.com/larvalabs/status/1486092138534387712?cxt=HHwWgIC-zaS71J8pAAAA)


Why not post a less self-serving public service announcement?  Why not tell the world -  yes, the emperor has no clothes - that is,
that the "original" V2 or whatever pixel punks in the 24x24 format are as worthless as the V1 series? What's your take?


### Q: Can anyone explain the "Flex-How-Stupid-AND-Rich-I-Am?!"  [Crypto] Punks?  Why pay hundred thousands of dollars for a free public domain 24×24 pixel image?

**A:**  As a public service announcement let's restate what might get lost in the programming minutiae:

  Yes, CryptoPunks is a con-artist financial fraud. The Emperor has no clothes. Let's start with what you "own" when you buy a CryptoPunk [token].

   The only thing that you "own" is the private 256-bit integer number that you create (for free) on your own computer and that you MUST keep secret, that is, your private key.

   From the 256-bit integer number (private key) you get a "free" public key and public Ethereum account  - the account gets derived (calculated) via Elliptic Curve Cryptography from the public key¹.

   Anyways, if you now buy a CryptoPunks token via the CryptoPunksMarket contract / service - all you get is an entry in a database that you are now a "certified" CryptoPunks owner and you get assigned an index number (between 0 and 9999).   That's it.

  There's nothing decentralized or trustless.  You have to trust the central issuer LarvaLabs that you own a picture / image of punk.

   And the fact is that the LavraLabs crypto bros - Matt Hall and John Watkinson -  actually tell you that you don't. To quote:

>   My name is Mordecai Goldstein and I am the General Counsel
> of Larva Labs LLC [- a multi-million dollar crypto (con-art) fraudster
> operator].
>
> [..]
>
> The original [24×24 8-bit pixel] images [that any 6-year old can
>  redraw "by hand" in minutes²], to which we [claim to] own exclusive
> copyrights, can be found at: https://larvalabs.com/cryptopunks

  And so on and so forth. What's your take?


¹: Tip: See [**Derive the Ethereum (Elliptic Curve) Public Key from the Private Key and Generate the Ethereum Address from the (Elliptic Curve) Public Key**](https://github.com/rubycoco/blockchain/tree/master/crypto-lite#derive-the-ethereum-elliptic-curve-public-key-from-the-private-key) or any other of the many hundred (or thousands) crypto tutorials online.) It starts:

> A private key in ethereum is a 32-byte (256-bit) unsigned / positive integer number.
> Or more precise the private key is a random number between 1 and the order of the elliptic curve secp256k1 ...

²: Tip: Yes, you can. Draw your own punks "by hand". See [**Youtube Video - How to Make (Crypto) 2D Alien Pixel Punk #3100 in 3D Cubes w/ Blender from Scratch / Zero in 60 Seconds**](https://www.youtube.com/watch?v=VaLaBYJl4u0) or any other of the hundred tutorials online.



<!--
comments_url: https://old.reddit.com/r/CryptoPunksDev/comments/ppb0fh/public_service_announcement_yes_cryptopunks_is_a/
-->




## Questions? Comments?

Join us in the [Punk Art discord (chat server)]( https://discord.gg/FE3HeXNKRa). Yes you can.
Your questions and commetary welcome.


Or post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.




## License

The Programming Punk Step-by-Step book / guide
is dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


---

For more blockchain books, see the [**Best of Crypto Books page »**](https://openblockchains.github.io/crypto-books/)
