###
#  to run use:
#     ruby ./composite.rb


$LOAD_PATH.unshift( "../cryptopunks/cryptopunks/lib" )
require 'cryptopunks'

punks = Punks::Image::Composite.read( './punks.png' )


## load csv dataset for meta data
recs = Punks::Dataset.read( '../punks/*999.csv' )

puts "  #{recs.size} punk metadata record(s)"
#=> 10000 punk metadata record(s)



aliens = recs.select {|rec| rec.alien? }

puts "   #{aliens.size} alien metadata record(s)"
#=> 9

## 3x3 (=9) composite
composite = Punks::Image::Composite.new( 3, 3 )
aliens.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( "i/aliens.png" )


apes = recs.select {|rec| rec.ape? }

puts "   #{apes.size} ape metadata record(s)"
#=> 24

## 4x6 (=24) composite
composite = Punks::Image::Composite.new( 4, 6 )
apes.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( "i/apes.png" )



zombies = recs.select {|rec| rec.zombie? }

puts "   #{zombies.size} zombie metadata record(s)"
#=> 88

## 8x11 (=88) composite
composite = Punks::Image::Composite.new( 8, 11 )
zombies.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( "i/zombies.png" )


blondies = recs.select do |rec|
                            rec.female? &&
                            (rec.has?( 'Blonde Short' ) ||
                             rec.has?( 'Blonde Bob' ) ||
                             rec.has?( 'Wild Blonde') ||
                             rec.has?( 'Straight Hair Blonde'))
                      end

puts "   #{blondies.size} blondie metadata record(s)"
#=> 564

## 25x23  (= max. 575) composite
composite = Punks::Image::Composite.new( 25, 23 )
blondies.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( "i/blondies.png" )



mohawks = recs.select do |rec|
                        rec.has?( 'Mohawk') ||
                        rec.has?( 'Mohawk Thin' ) ||
                        rec.has?( 'Mohawk Dark') ||
                        rec.has?( 'Red Mohawk' )
                      end

puts "   #{mohawks.size} mohawk metadata record(s)"
#=> 1458


## 40x37  (= max. 1480) composite

composite = Punks::Image::Composite.new( 40, 37 )
mohawks.each do |rec|
   composite << punks[ rec.id ]
end

composite.save( "i/mohawks.png" )


puts "bye"
