# Appendix - Pixel Art Special Effects Gallery / Cheatsheet - Free Ideas & Recipes for Starting Your Own CryptoPunks Collection Today



Let's use the punks
alien ![](i/punk-3100.png) #3100,
zombie ![](i/punk-3393.png) #3393,
blondie ![](i/punk-0172.png) #172 and
beanie ![](i/punk-2964.png) #2964
to show off the special effects built into
the pixel art machinery.



## Zoom

Let's change the zoom factor.

4x:

``` ruby
punk.zoom(4)
```

![](i/punk-3100x4.png)
![](i/punk-3393x4.png)
![](i/punk-0172x4.png)
![](i/punk-2964x4.png)


8x:

``` ruby
punk.zoom(8)
```

![](i/punk-3100x8.png)
![](i/punk-3393x8.png)
![](i/punk-0172x8.png)
![](i/punk-2964x8.png)




## Mirror - From Right-Facing to Left-Facing

Let's flip the pixels horizontally.


``` ruby
punk.mirror
```

![](i/phunk-3100.png)
![](i/phunk-3393.png)
![](i/phunk-0172.png)
![](i/phunk-2964.png)  4x:
![](i/phunk-3100x4.png)
![](i/phunk-3393x4.png)
![](i/phunk-0172x4.png)
![](i/phunk-2964x4.png)



## 8-Bit Color Palette - Greyscale, Sepia, Blue, Futuristic False

Let's change the color to black & white or
more scientifically known as 8-bit grayscale, that is,
256 shades of gray
starting with black (`0x000000`)
and ending with white (`0xffffff`):


``` ruby
punk.grayscale
```

![](i/punk-3100_bw.png)
![](i/punk-3393_bw.png)
![](i/punk-0172_bw.png)
![](i/punk-2964_bw.png)  4x:
![](i/punk-3100_bwx4.png)
![](i/punk-3393_bwx4.png)
![](i/punk-0172_bwx4.png)
![](i/punk-2964_bwx4.png)

 §

Let's change the color palette to ye olde' sepia:

``` ruby
punk.change_palette8bit( Palette8bit::SEPIA )
```

![](i/punk-3100_sepia.png)
![](i/punk-3393_sepia.png)
![](i/punk-0172_sepia.png)
![](i/punk-2964_sepia.png)  4x:
![](i/punk-3100_sepiax4.png)
![](i/punk-3393_sepiax4.png)
![](i/punk-0172_sepiax4.png)
![](i/punk-2964_sepiax4.png)

 §

Let's change the color palette to a blue theme:

``` ruby
punk.change_palette8bit( Palette8bit::BLUE )
```

![](i/punk-3100_blue.png)
![](i/punk-3393_blue.png)
![](i/punk-0172_blue.png)
![](i/punk-2964_blue.png)  4x:
![](i/punk-3100_bluex4.png)
![](i/punk-3393_bluex4.png)
![](i/punk-0172_bluex4.png)
![](i/punk-2964_bluex4.png)


 §

Let's change the color palette to the futuristic false series:

``` ruby
punk.change_palette8bit( Palette8bit::FALSE )
```

![](i/punk-3100_false.png)
![](i/punk-3393_false.png)
![](i/punk-0172_false.png)
![](i/punk-2964_false.png)  4x:
![](i/punk-3100_falsex4.png)
![](i/punk-3393_falsex4.png)
![](i/punk-0172_falsex4.png)
![](i/punk-2964_falsex4.png)





## Black & White (Pencil Drawing) Sketch

Let's change to a black & white (pecil drawing) sketch.

Sketch zoom - 4 pixels, line (brush) - 1 pixel   (the default):

``` ruby
punk.sketch( 4 )
```

![](i/punk-3100_sketch4x.png)
![](i/punk-3393_sketch4x.png)
![](i/punk-0172_sketch4x.png)
![](i/punk-2964_sketch4x.png)

 §


Sketch zoom - 4 pixels, line (brush) - 4 pixels:

``` ruby
punk.sketch( 4, line: 4 )
```

![](i/punk-3100_sketch4x4.png)
![](i/punk-3393_sketch4x4.png)
![](i/punk-0172_sketch4x4.png)
![](i/punk-2964_sketch4x4.png)

 §


Sketch zoom - 8 pixels, line (brush) - 2 pixels:

``` ruby
punk.sketch( 8, line: 2 )
```

![](i/punk-3100_sketch8x2.png)
![](i/punk-3393_sketch8x2.png)
![](i/punk-0172_sketch8x2.png)
![](i/punk-2964_sketch8x2.png)

 §


Sketch zoom - 12 pixels, line (brush) - 3 pixels:

``` ruby
punk.sketch( 12, line: 3 )
```

![](i/punk-3100_sketch12x3.png)
![](i/punk-3393_sketch12x3.png)
![](i/punk-0172_sketch12x3.png)
![](i/punk-2964_sketch12x3.png)





And some more.


