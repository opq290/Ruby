# -*- coding: utf-8 -*-
require 'set' # Setを使う時は入れる
load"sieve.rb"


def test
  f = open("mushroom4.dat")
  atr=Array.new(120)
  for i in 0..atr.length-1
    atr[i]=0
  end
  
  while line = f.gets
    d=line.chomp.split(/ /)
    for i in 0..d.length-1
      atr[d[i].to_i] +=1
    end
 end
  itemset1=Array.new
  for i in 0..atr.length-1
    if atr[i] >= 2000
     itemset1.push(Set[i])
    end
  end
  itemsetf2=Array.new
for i in 0..itemset1.length-2
  for j in i+1..itemset1.length-1
    itemsetf2.push(itemset1[i] | itemset1[j])
   end
end

p itemsetf2
    
end

def itemset(k)
  s = open("mushroom4.dat")
  c=Array.new
 while (j=s.gets) !=nil do 
d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23= j.chomp.split(/ /)
   c << [d1.to_i,d2.to_i,d3.to_i,d4.to_i,d5.to_i,d6.to_i,d7.to_i,d8.to_i,d9.to_i,d10.to_i,d11.to_i,d12.to_i,d13.to_i,d14.to_i,d15.to_i,d16.to_i,d17.to_i,d18.to_i,d19.to_i,d20.to_i,d21.to_i,d22.to_i,d23.to_i]
 end
  v=BitVector.new(8124*120)
  for i in 0..c.length-1
    for j in 0..22
      v.set(120*i+c[i][j])
    end
  end
 if k == 1
   y = Array.new
   atr=Array.new(120)
   for i in 0..atr.length-1
     atr[i] = 0
   end
  for i in 0..atr.length-1
    for j in 0..c.length-1
      if v.bit(120*j+i) == true
        atr[i] += 1
      end
    end
   if atr[i] >= 2000
     y << Set[i]
   end
  end
else

      
    
   while k >= 2  
     b=itemset(k-1)
     x=Array.new
     for i in 0..b.length-1
       j=i+1
       while j < b.length-1 && (b[i]&b[j]).size == k-2
         x << (b[i] | b[j])
         j += 1
       end
     end
     y=Array.new
  
     for i in 0..x.length-1
       count=0
       for j in 0..c.length-1
         if x[i].all?{|e| v.bit(120*j+e)==true}==true
           count += 1
         end
       end
       if count >= 2000
         y << x[i]
       end
     end
   end

end
end
     
    
    


