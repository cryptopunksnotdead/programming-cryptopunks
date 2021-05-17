###
#  to run use:
#     ruby ./monalisa.rb


require 'cryptopunks'


capforward = Image.parse( <<TXT, colors: ['000000','353535','515151'] )
. . @ @ @ @ @ @ @ . . . .
. @ x o o o o o o @ . . .
@ x o o o o o o o o @ . .
@ o o o @ @ @ @ @ @ @ @ .
@ o o @ x x x x x x x x @
@ @ @ @ @ @ @ @ @ @ @ @ @
TXT

capforward.save( './i/capforward.png' )
capforward.zoom(4).save('./i/capforwardx4.png')


smallshades = Image.parse( <<TXT, colors: ['000000'] )
@ @ @ @ @ @ @ @ @ @ @ @
. . . . @ @ . . . @ @ .
. . . . @ @ . . . @ @ .
TXT

smallshades.save( './i/smallshades.png' )
smallshades.zoom(4).save( './i/smallshadesx4.png' )


pipe = Image.parse( <<TXT, colors: ['000000', '683c08', '855114', 'b9b9b980'] )
. . . . . . . ^ . .
. . . . . . ^ ^ ^ .
. . . . . . ^ ^ ^ .
. . . . . . . . . .
. . . . . . . ^ . .
. . . . . . . . . .
. . . . . . . ^ . .
. @ . . . . . . . .
@ o @ . . @ @ @ @ @
. @ o @ . @ o o o @
. . @ o @ @ x o x @
. . . @ o o o x @ .
. . . . @ @ @ @ . .
TXT

pipe.save( './i/pipe.png' )
pipe.zoom(4).save( './i/pipex4.png' )



mr = Image.parse( <<TXT, colors: ['000000', '75bdbd', '9be0e0', 'c8fbfb'] )
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . @ @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . @ @ ^ ^ x @ ^ ^ ^ x @ @ . . . . . . .
. . . . @ ^ o ^ ^ @ o ^ ^ ^ @ o @ . . . . . . .
. . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . @ @ ^ ^ ^ ^ ^ o ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ o ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ o ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ @ @ @ @ @ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . @ ^ ^ ^ @ @ @ @ @ . . . . . . . . .
. . . . . . @ ^ ^ ^ @ . . . . . . . . . . . . .
. . . . . . @ ^ ^ ^ @ . . . . . . . . . . . . .
TXT

mr.save( './i/mrmonalisa_0.png' )
mr.zoom(4).save( './i/mrmonalisax4_0.png' )


## step 1 - add capforward
mr.compose!( capforward, 6, 4 )
mr.zoom(4).save( './i/mrmonalisax4_1.png' )

## step 2 - add smallshades
mr.compose!( smallshades, 5, 11 )
mr.zoom(4).save( './i/mrmonalisax4_2.png' )

## step 3 - add pipe
mr.compose!( pipe, 13, 11 )
mr.save( './i/mrmonalisa_3.png' )
mr.zoom(4).save( './i/mrmonalisax4_3.png' )

## step 4 - add simile
mr[9,17] = Color::BLACK
mr.save( './i/mrmonalisa.png' )
mr.zoom(4).save( './i/mrmonalisax4.png' )


### mrs
mrs = Image.parse( <<TXT, colors: ['000000', '75bdbd', '9be0e0', 'c8fbfb'] )
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . @ ^ ^ x @ ^ ^ ^ x @ @ . . . . . . .
. . . . . . @ ^ ^ @ o ^ ^ ^ @ o @ . . . . . . .
. . . . . . @ @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ o ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ o ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ ^ ^ ^ @ @ @ ^ ^ @ . . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . . @ ^ @ ^ ^ ^ @ . . . . . . . . .
. . . . . . . . @ ^ ^ @ @ @ . . . . . . . . . .
. . . . . . . . @ ^ ^ ^ @ . . . . . . . . . . .
. . . . . . . . @ ^ ^ ^ @ . . . . . . . . . . .
TXT

mrs.zoom(4).save( './i/mrsmonalisax4_0.png')

mrs.compose!( capforward, 7, 4 )
mrs.zoom(4).save( './i/mrsmonalisax4_1.png' )

mrs.compose!( smallshades, 5, 11 )
mrs.zoom(4).save( './i/mrsmonalisax4_2.png' )

mrs.compose!( pipe, 13, 11 )
mrs.save( './i/mrsmonalisa_3.png' )
mrs.zoom(4).save( './i/mrsmonalisax4_3.png' )

mrs[10,17] = Color::BLACK
mrs.save( './i/mrsmonalisa.png' )
mrs.zoom(4).save( './i/mrsmonalisax4.png' )

## add smile - single pixel :-).


### add composite (2x1)
mrmrs = Punks::Image::Composite.new( 2, 1 )
mrmrs << mr
mrmrs << mrs

mrmrs.save( './i/mrmrsmonalisa.png' )
mrmrs.zoom(4).save( './i/mrmrsmonalisax4.png' )


mrmrs.mirror.save( './i/mrmrsmonalisa_left.png' )
mrmrs.mirror.zoom(4).save( './i/mrmrsmonalisa_leftx4.png' )


puts "bye"