# United Colors of Humanity -  Light, Lighter, Dark, Darker


The human female / male punks
in the original Lavra labs 24x24 series are
available in four base colors / skin tones.


Let's have a looksie at the super-rare punks with zero accessories / attributes:


``` ruby
require 'cryptopunks'

punks = Punks::Image::Composite.read( './punks.png' )

ids = [3307, 281, 510, 741]
ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  punk.save( "./punk-#{name}.png" )
  punk.zoom(4).save( "./punk-#{name}x4.png" )
end
```

Voila!

![](i/punk-3307.png)
![](i/punk-0281.png)
![](i/punk-0510.png)
![](i/punk-0741.png)

![](i/punk-3307x4.png)
![](i/punk-0281x4.png)
![](i/punk-0510x4.png)
![](i/punk-0741x4.png)



And let's look at the punkettes:

``` ruby
ids = [6487, 641, 1050, 2204]
ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  punk.save( "./punk-#{name}.png" )
  punk.zoom(4).save( "./punk-#{name}x4.png" )
end
```

Voila!

![](i/punk-6487.png)
![](i/punk-0641.png)
![](i/punk-1050.png)
![](i/punk-2204.png)

![](i/punk-6487x4.png)
![](i/punk-0641x4.png)
![](i/punk-1050x4.png)
![](i/punk-2204x4.png)







