# Statistics, Statistics, Statistics - Calculate Rarity & Popularity By Type, By Accessories, & More - Inside the 10 000 Punk Population


> Ultra-rare alien [24×24 pixel] CryptoPunk
> sells for 605 ETH, or $750,000.
> The investment thesis. "Aliens are the rarest form of CryptoPunk and
> we believe that the acquired Alien [![](i/punk-2890.png) [#2890](https://www.larvalabs.com/cryptopunks/details/2890), one of nine]
> will be prized by collectors over
> time and mature into an iconic digital art piece."
>
> -- [January 2021](https://cointelegraph.com/news/ultra-rare-alien-cryptopunk-nft-sells-for-605-eth-or-750-000)


Crypto collectibles are all about rarity - the more rare the type or accessories of a punk the more valuable the 24x24 pixel art in theory.

Let's use the [`cryptopunks.csv` (classic) dataset](https://github.com/cryptopunksnotdead/punks)
in comma-separated values (CSV) format
that houses all the 10 000 punks for more insight into the population.


The data records for punks
incl. id, type, count (of accessories), and accessories.
Example:

```
id, type, count, accessories
0, Female, 3, Green Eye Shadow / Earring / Blonde Bob
1, Male, 2, Smile / Mohawk
2, Female, 1, Wild Hair
3, Male, 3, Wild Hair / Nerd Glasses / Pipe
4, Male, 4, Big Shades / Wild Hair / Earring / Goat
5, Female, 3, Purple Eye Shadow / Half Shaved / Earring
...
```


Let's read in the dataset:


``` ruby
require 'punks'

punks = Punks::Dataset.read( './cryptopunks-classic.csv' )
punks.size
#=> 10000
```

Let the punk dataset helper do the heavy lifting :-).
As a bonus all punks get wrapped into easy-to-access structs.
Example:

``` ruby
punk = punks[0]
punk.id
#=> 0
punk.type
#=> "Female"
punk.accessories.size
#=> 3
punk.accessories[0]
#=> "Green Eye Shadow"
punk.accessories[1]
#=> "Earring"
punk.accessories[2]
#=> "Blonde Bob"
```


## Popularity & Rarity by Punk Types (5)

Let's calculate popularity & rarity by punk types:

``` ruby
counter = Hash.new(0)      # a hash (table) - let's (auto-)default to 0 for values
punks.each do |punk|
  counter[ punk.type ] += 1
end

counter.size
#=> 5
counter
#=> {"Female"=>3840, "Male"=>6039, "Zombie"=>88, "Ape"=>24, "Alien"=>9}
```

Resulting in five punk types.
Let's sort by count with rarest first and pretty print the result
and as a bonus let's calculate the percentage (%) in the total population:

``` ruby
counter = counter.sort { |l,r| l[1]<=>r[1] }
#=> [["Alien", 9], ["Ape", 24], ["Zombie", 88], ["Female", 3840], ["Male", 6039]]

counter.each do |rec|
  name    = rec[0]
  count   = rec[1]
  percent =  Float(count*100)/Float(punks.size)

  puts '%-12s | %4d  (%5.2f %%)' % [name, count, percent]
end
```

Resulting in:

```
Alien        |    9  ( 0.09 %)
Ape          |   24  ( 0.24 %)
Zombie       |   88  ( 0.88 %)
Female       | 3840  (38.40 %)
Male         | 6039  (60.39 %)
```

That is, out of 10 000 punks only 9 are aliens (the rarest)
and 6 039 are male (the most popular), that is, 60.39 % of the total population.




## Popularity & Rarity by Accessories (87)

Next let's calculate popularity & rarity by accessories and
let's break out the count by punk type:

``` ruby
counter = {}
punks.each do |punk|
  punk.accessories.each do |acc|
    rec = counter[ acc ] ||= { count: 0,
                               by_type: Hash.new(0)
                             }

    rec[ :count ] += 1
    rec[ :by_type ][ punk.type ] += 1
  end
end

counter.size
#=> 87
counter
#=> {"Green Eye Shadow"=>{:count=>271,
#                         :by_type=>{"Female"=>271}},
#    "Earring"=>{:count=>2459,
#                :by_type=>{"Female"=>933,"Male"=>1498,"Zombie"=>22,"Ape"=>3, "Alien"=>3}},
#    "Blonde Bob"=>{:count=>147,
#                   :by_type=>{"Female"=>147}},
#    "Smile"=>{:count=>238,
#              :by_type=>{"Male"=>234, "Zombie"=>4}},
#    "Mohawk"=>{:count=>441,
#              :by_type=>{"Male"=>286, "Female"=>153, "Zombie"=>2}},
#   ... }
```

Resulting in 87 accessories.
Let's again sort by count with rarest first and pretty print the result:


```ruby
counter.each do |rec|
  name    = rec[0]
  count   = rec[1][:count]
  percent = Float(count*100)/Float(punks.size)

  print '%-20s | %4d  (%5.2f %%) | ' % [name, count, percent]

  ## add by type - highest first (lowest last)
  types = rec[1][:by_type]
  types = types.sort { |l,r| r[1]<=>l[1] }

  print types.map {|type| "#{type[0]} (#{type[1]})" }.join( ' · ')
  print "\n"
end
```

Resulting in:

```
Beanie               |   44  ( 0.44 %) | Male (43) · Zombie (1)
Choker               |   48  ( 0.48 %) | Female (48)
Pilot Helmet         |   54  ( 0.54 %) | Female (54)
Tiara                |   55  ( 0.55 %) | Female (55)
Orange Side          |   68  ( 0.68 %) | Female (68)
Buck Teeth           |   78  ( 0.78 %) | Male (78)
Welding Goggles      |   86  ( 0.86 %) | Female (86)
Pigtails             |   94  ( 0.94 %) | Female (94)
Pink With Hat        |   95  ( 0.95 %) | Female (95)
Top Hat              |  115  ( 1.15 %) | Male (112) · Zombie (2) · Ape (1)
Spots                |  124  ( 1.24 %) | Male (73) · Female (51)
Rosy Cheeks          |  128  ( 1.28 %) | Male (67) · Female (60) · Zombie (1)
Blonde Short         |  129  ( 1.29 %) | Female (129)
Wild White Hair      |  136  ( 1.36 %) | Female (136)
Cowboy Hat           |  142  ( 1.42 %) | Male (139) · Ape (2) · Alien (1)
Straight Hair Blonde |  144  ( 1.44 %) | Female (144)
Wild Blonde          |  144  ( 1.44 %) | Female (144)
Big Beard            |  146  ( 1.46 %) | Male (146)
Red Mohawk           |  147  ( 1.47 %) | Female (147)
Vampire Hair         |  147  ( 1.47 %) | Male (146) · Zombie (1)
Blonde Bob           |  147  ( 1.47 %) | Female (147)
Half Shaved          |  147  ( 1.47 %) | Female (147)
Straight Hair Dark   |  148  ( 1.48 %) | Female (148)
Clown Hair Green     |  148  ( 1.48 %) | Male (85) · Female (63)
Straight Hair        |  151  ( 1.51 %) | Female (151)
Silver Chain         |  156  ( 1.56 %) | Male (113) · Female (43)
Dark Hair            |  157  ( 1.57 %) | Female (157)
Purple Hair          |  165  ( 1.65 %) | Male (163) · Zombie (2)
Gold Chain           |  169  ( 1.69 %) | Male (107) · Female (60) · Ape (1) · Zombie (1)
Medical Mask         |  175  ( 1.75 %) | Male (107) · Female (65) · Zombie (2) · Alien (1)
Tassle Hat           |  178  ( 1.78 %) | Female (178)
Fedora               |  186  ( 1.86 %) | Male (184) · Ape (1) · Zombie (1)
Police Cap           |  203  ( 2.03 %) | Male (200) · Zombie (2) · Ape (1)
Clown Nose           |  212  ( 2.12 %) | Male (134) · Female (76) · Zombie (2)
Smile                |  238  ( 2.38 %) | Male (234) · Zombie (4)
Cap Forward          |  254  ( 2.54 %) | Male (248) · Zombie (3) · Ape (2) · Alien (1)
Hoodie               |  259  ( 2.59 %) | Male (256) · Zombie (2) · Ape (1)
Front Beard Dark     |  260  ( 2.60 %) | Male (255) · Zombie (5)
Frown                |  261  ( 2.61 %) | Male (257) · Zombie (4)
Purple Eye Shadow    |  262  ( 2.62 %) | Female (262)
Handlebars           |  263  ( 2.63 %) | Male (261) · Zombie (2)
Blue Eye Shadow      |  266  ( 2.66 %) | Female (266)
Green Eye Shadow     |  271  ( 2.71 %) | Female (271)
Vape                 |  272  ( 2.72 %) | Male (161) · Female (110) · Ape (1)
Front Beard          |  273  ( 2.73 %) | Male (270) · Zombie (3)
Chinstrap            |  282  ( 2.82 %) | Male (280) · Zombie (2)
Luxurious Beard      |  286  ( 2.86 %) | Male (281) · Zombie (5)
3D Glasses           |  286  ( 2.86 %) | Male (205) · Female (78) · Zombie (2) · Ape (1)
Mustache             |  288  ( 2.88 %) | Male (286) · Zombie (2)
Normal Beard Black   |  289  ( 2.89 %) | Male (286) · Zombie (3)
Normal Beard         |  292  ( 2.92 %) | Male (291) · Zombie (1)
Eye Mask             |  293  ( 2.93 %) | Male (205) · Female (86) · Zombie (1) · Ape (1)
Goat                 |  295  ( 2.95 %) | Male (292) · Zombie (3)
Do-rag               |  300  ( 3.00 %) | Male (292) · Zombie (4) · Ape (3) · Alien (1)
Shaved Head          |  300  ( 3.00 %) | Male (298) · Zombie (2)
Peak Spike           |  303  ( 3.03 %) | Male (298) · Zombie (5)
Muttonchops          |  303  ( 3.03 %) | Male (303)
Pipe                 |  317  ( 3.17 %) | Male (186) · Female (130) · Alien (1)
VR                   |  332  ( 3.32 %) | Male (242) · Female (88) · Zombie (1) · Ape (1)
Cap                  |  351  ( 3.51 %) | Male (245) · Female (98) · Ape (4) · Zombie (3) · Alien (1)
Small Shades         |  378  ( 3.78 %) | Male (372) · Alien (2) · Zombie (2) · Ape (2)
Clown Eyes Green     |  382  ( 3.82 %) | Female (246) · Male (136)
Clown Eyes Blue      |  384  ( 3.84 %) | Female (274) · Male (108) · Zombie (2)
Headband             |  406  ( 4.06 %) | Male (304) · Female (96) · Zombie (4) · Alien (1) · Ape (1)
Crazy Hair           |  414  ( 4.14 %) | Male (239) · Female (168) · Zombie (7)
Knitted Cap          |  419  ( 4.19 %) | Male (305) · Female (101) · Zombie (7) · Ape (4) · Alien (2)
Mohawk Dark          |  429  ( 4.29 %) | Male (279) · Female (146) · Zombie (4)
Mohawk               |  441  ( 4.41 %) | Male (286) · Female (153) · Zombie (2)
Mohawk Thin          |  441  ( 4.41 %) | Male (285) · Female (152) · Zombie (4)
Frumpy Hair          |  442  ( 4.42 %) | Male (289) · Female (149) · Zombie (4)
Wild Hair            |  447  ( 4.47 %) | Male (296) · Female (144) · Zombie (7)
Messy Hair           |  460  ( 4.60 %) | Male (294) · Female (160) · Zombie (6)
Eye Patch            |  461  ( 4.61 %) | Male (363) · Female (92) · Zombie (4) · Ape (2)
Stringy Hair         |  463  ( 4.63 %) | Male (292) · Female (165) · Zombie (6)
Bandana              |  481  ( 4.81 %) | Male (304) · Female (164) · Zombie (7) · Ape (4) · Alien (2)
Classic Shades       |  502  ( 5.02 %) | Male (345) · Female (154) · Zombie (3)
Shadow Beard         |  526  ( 5.26 %) | Male (516) · Zombie (10)
Regular Shades       |  527  ( 5.27 %) | Male (393) · Female (128) · Zombie (4) · Ape (1) · Alien (1)
Big Shades           |  535  ( 5.35 %) | Male (372) · Female (159) · Zombie (3) · Ape (1)
Horned Rim Glasses   |  535  ( 5.35 %) | Male (388) · Female (142) · Zombie (4) · Ape (1)
Nerd Glasses         |  572  ( 5.72 %) | Male (392) · Female (175) · Zombie (3) · Ape (2)
Black Lipstick       |  617  ( 6.17 %) | Female (617)
Mole                 |  644  ( 6.44 %) | Male (357) · Female (285) · Zombie (2)
Purple Lipstick      |  655  ( 6.55 %) | Female (655)
Hot Lipstick         |  696  ( 6.96 %) | Female (696)
Cigarette            |  961  ( 9.61 %) | Male (557) · Female (392) · Zombie (11) · Ape (1)
Earring              | 2459  (24.59 %) | Male (1498) · Female (933) · Zombie (22) · Alien (3) · Ape (3)
```




### Popularity & Rarity by Accessory Count (0 to 7)

To wrap up let's calculate popularity & rarity by the number of accessories:

``` ruby
counter = Hash.new(0)
punks.each do |punk|
  counter[ punk.accessories.size ] += 1
end

counter.size
#=> 8
counter
#=> {"3"=>4501, "2"=>3560, "1"=>333, "4"=>1420, "5"=>166, "0"=>8, "6"=>11, "7"=>1}
```

Resulting in 8 classes.
Let's sort by natural count, that is, from 0 to 7 and pretty print the result:

``` ruby
counter = counter.sort { |l,r| l[0]<=>r[0] }

## pretty print
counter.each do |rec|
  name    = rec[0]
  count   = rec[1]
  percent =  Float(count*100)/Float(punks.size)

  puts '%-12s | %4d  (%5.2f %%)' % [name, count, percent]
end
```

Resulting in:

```
0            |    8  ( 0.08 %)
1            |  333  ( 3.33 %)
2            | 3560  (35.60 %)
3            | 4501  (45.01 %)
4            | 1420  (14.20 %)
5            |  166  ( 1.66 %)
6            |   11  ( 0.11 %)
7            |    1  ( 0.01 %)
```


Voila! That's it to get your started on calculating rarity & popularity
stats on the 10 000 punk population.





<!--

**REMINDER: In the digitial world there are no originals! Every copy is a original and you cannot tell the difference
(all 0s and 1s are the same). And, yes, you can always make as many (free) copies as you like (in a free world).
Claiming that you can protect your exclusive rights to pixels because the record of ownership
is stored in a public database is absurd.
Without laws and governments that help you with your rights - the claim is just
a meaningless series of 0s and 1s.  PS: Do you really own CryptoPunks? (Spoiler: No.)
Check your license agreement with LarvaLabs - the pixel art license seller - and do NOT get fooled by the record of ownership.
You are a licensee and NOT an owner.**


-->



