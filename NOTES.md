# Notes


## Substrapunks


make it "true" pixel art,
shrink 560x560 to 56x56 (assuming a pixel size of 10x)
note: the following parts do NOT fit the 56x56 (10x) formula
and got removed for now (fix later if possible - why? why not?)



also removed the all-transparent (empty) beard parts for now


```
 beard: { ...           ['',                'u'],  ## was: beard2.png
                        ['',                'u'],  ## was: beard4.png
                        ['',                'u'],  ## was: beard6.png
                        ['',                'u']]  ## was: beard8.png

 hair:  { ...
                        ['Caret Hair',     'f'],  ## hair11.png
                        ['Pony Tails'      'f']]}  ## hair12.png

 access: { required: false,
            attributes: [['Cigar',        'u'],
                         ['Pipe',         'u']] }

```