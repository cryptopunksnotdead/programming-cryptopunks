# Appendix - Pixel Art Special Effects Gallery / Cheatsheet - Free Ideas & Recipes for Starting Your Own "Transformative" CryptoPunks Collection Today



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

 o o o

8x:

``` ruby
punk.zoom(8)
```

![](i/phunk-3100x8.png)
![](i/phunk-3393x8.png)
![](i/phunk-0172x8.png)
![](i/phunk-2964x8.png)




## Mirror - From Right-Facing to Left-Facing

Let's flip the pixels horizontally.


``` ruby
punk.mirror
```
![](i/phunk-3100.png)
![](i/phunk-3393.png)
![](i/phunk-0172.png)
![](i/phunk-2964.png)




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

  o o o


Sketch zoom - 4 pixels, line (brush) - 4 pixels:

``` ruby
punk.sketch( 4, line: 4 )
```

![](i/punk-3100_sketch4x4.png)
![](i/punk-3393_sketch4x4.png)
![](i/punk-0172_sketch4x4.png)
![](i/punk-2964_sketch4x4.png)

  o o o


Sketch zoom - 8 pixels, line (brush) - 2 pixels:

``` ruby
punk.sketch( 8, line: 2 )
```

![](i/punk-3100_sketch8x2.png)
![](i/punk-3393_sketch8x2.png)
![](i/punk-0172_sketch8x2.png)
![](i/punk-2964_sketch8x2.png)

 o o o


Sketch zoom - 12 pixels, line (brush) - 3 pixels:

``` ruby
punk.sketch( 12, line: 3 )
```

![](i/punk-3100_sketch12x3.png)
![](i/punk-3393_sketch12x3.png)
![](i/punk-0172_sketch12x3.png)
![](i/punk-2964_sketch12x3.png)





And some more.


