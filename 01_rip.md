# Do-It-Yourself (DIY) - Yes, You Can! - Rip & Save Your Own Punks in Original 24x24 Pixel Format or With 2X / 4X / 8X Zoom


## Step 0 -  Download the True Official Genuine Matt & John's® (Crypto) Punks composite image

One time / first time only - Download the True Official Genuine Matt & John's® (Crypto) Punks composite
housing all 10 000 punks
in a single 2400×2400 image (~830 kb) for free.
See [`punks.png` »](https://github.com/larvalabs/cryptopunks/blob/master/punks.png)


![](i/punks-zoom.png)



Let's create a script to rip & save punks.

## Step 1 -  Read True Official Genuine Matt & John's® (Crypto) Punks composite image


``` ruby
require 'pixelart'

punks = ImageComposite.read( './punks.png' )
```


## Step 2 - Start ripping 

Note: By default punks get saved in the original 24x24 pixel format
and the first punk starts at index zero, that is, `0`.
running up to 9999.

``` ruby
punks[0].save( './punk-0000.png' )
punks[2890].save( './punk-2890.png' )
punks[8219].save( './punk-8219.png')
```


And voila!

![](i/punk-0000.png)
![](i/punk-2890.png)
![](i/punk-8219.png)


Let's change the zoom factor:

``` ruby
punks[0].zoom(4).save( './punk-0000@4x.png' )   # use x4
punks[2890].zoom(4).save( './punk-2890@4x.png' )
punks[8219].zoom(4).save( './punk-8219@4x.png')

punks[0].zoom(8).save( './punk-0000@8x.png' )  # or use x8
punks[2890].zoom(8).save( './punk-2890@8x.png' )
punks[8219].zoom(8).save( './punk-8219@8x.png')
```

And x4:

![](i/punk-0000x4.png)
![](i/punk-2890x4.png)
![](i/punk-8219x4.png)


And x8:

![](i/punk-0000x8.png)
![](i/punk-2890x8.png)
![](i/punk-8219x8.png)


And so on.



## 1000 More Punks  - Unauthorized? No Way?!- Fuck the Establishment - Yes, You Can - Do-It-Yourself - Use Your Own Collections


Yes, you can pass along any unauthorized edition.
Only make sure all punks are lined-up left-to-right, top-to-bottom
in the 24x24 pixel format in the composite image.


Let's try the 1000 More Punks series housing punks in
packs of a hundred each. Let's have a looksie at the first 100
in the series.


![](i/more-punks-1.png)



Let's rip & save punk #0, #18, #40, and #88
and let's add an offset of 10000
(to start counting at 10000 instead of 0) when saving to disk:

``` ruby
punks = ImageComposite.read( './more-punks-1.png' )

punks[0].save('./punk-10000.png')
punks[18].save('./punk-10018.png')
punks[40].save('./punk-10040.png')
punks[88].save('./punk-10088.png')

punks[0].zoom(4).save('./punk-10000@4x.png')
punks[18].zoom(4).save('./punk-10018@4x.png')
punks[40].zoom(4).save('./punk-10040@4x.png')
punks[88].zoom(4).save('./punk-10088@4x.png')
```

And voila!

![](i/punk-10000.png)
![](i/punk-10018.png)
![](i/punk-10040.png)
![](i/punk-10088.png)


And 4x:

![](i/punk-10000x4.png)
![](i/punk-10018x4.png)
![](i/punk-10040x4.png)
![](i/punk-10088x4.png)




Let's try the second pack - that is, punks 100 to 199 in the series.


![](i/more-punks-2.png)



Let's rip & save punk #0, #79, #80, and #90
and let's add an offset of 10100
(to start counting at 10000 plus 100 instead of 0):

``` ruby
punks = ImageComposite.read( './more-punks-2.png' )

punks[0].save('./punk-10100.png')
punks[79].save('./punk-10179.png')
punks[80].save('./punk-10180.png')
punks[90].save('./punk-10190.png')

punks[0].zoom(4).save('./punk-10100@4x.png')
punks[79].zoom(4).save('./punk-10179@4x.png')
punks[80].zoom(4).save('./punk-10180@4x.png')
punks[90].zoom(4).save('./punk-10190@4x.png')
```

And voila! Super rare - world's first female alien and much more.


![](i/punk-10100.png)
![](i/punk-10179.png)
![](i/punk-10180.png)
![](i/punk-10190.png)


And 4x:

![](i/punk-10100x4.png)
![](i/punk-10179x4.png)
![](i/punk-10180x4.png)
![](i/punk-10190x4.png)


And so on. Happy miniting.






## Frequently Asked Questions (F.A.Q.s) and Answers

### Q: How can I rip & save all punks from 0 to 9999 from the Matt & John's  24x24 series?


Use a script with a loop like:

``` ruby
# step 1: read composite image
punks = ImageComposite.read( './punks.png' )

# step 2: rip & save all punks
(0..9999).each do |i|
  name = '%04d' % i
  punks[i].save( "./punk-#{name}.png" )
end
```


