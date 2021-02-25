require 'cryptopunks'

punks = Punks::Dataset.read( './punks/*.csv' )
punks.size
#=> 10000



punk = punks[0]
punk.id
#=> 0
punk.type.name
#=> "Female"
punk.accessories.size
#=> 3
punk.accessories[0].name
#=> "Green Eye Shadow"
punk.accessories[1].name
#=> "Earring"
punk.accessories[2].name
#=> "Blonde Bob"





## Popularity & Rarity by Punk Types (5)

counter = Hash.new(0)      # a hash (table) - let's (auto-)default to 0 for values
punks.each do |punk|
  counter[ punk.type.name ] += 1
end

counter.size
#=> 5
counter
#=> {"Female"=>3840, "Male"=>6039, "Zombie"=>88, "Ape"=>24, "Alien"=>9}


counter = counter.sort { |l,r| l[1]<=>r[1] }
#=> [["Alien", 9], ["Ape", 24], ["Zombie", 88], ["Female", 3840], ["Male", 6039]]

counter.each do |rec|
  name    = rec[0]
  count   = rec[1]
  percent =  Float(count*100)/Float(punks.size)

  puts '%-12s | %4d  (%5.2f %%)' % [name, count, percent]
end



## Popularity & Rarity by Accessories (87)

counter = {}
punks.each do |punk|
  punk.accessories.each do |acc|
    rec = counter[ acc.name ] ||= { count: 0,
                                    by_type: Hash.new(0)
                                  }

    rec[ :count ] += 1
    rec[ :by_type ][ punk.type.name ] += 1
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


### Popularity & Rarity by Accessory Count (0 to 7)

counter = Hash.new(0)
punks.each do |punk|
  counter[ punk.accessories.size ] += 1
end

counter.size
#=> 8
counter
#=> {"3"=>4501, "2"=>3560, "1"=>333, "4"=>1420, "5"=>166, "0"=>8, "6"=>11, "7"=>1}



counter = counter.sort { |l,r| l[0]<=>r[0] }

## pretty print
counter.each do |rec|
  name    = rec[0]
  count   = rec[1]
  percent =  Float(count*100)/Float(punks.size)

  puts '%-12s | %4d  (%5.2f %%)' % [name, count, percent]
end
