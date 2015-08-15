# -*- coding: utf-8 -*-
require 'set' # Setを使う時は入れる
load"sieve.rb"
def find
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
 itemset1 = Array.new
  for i in 0..119
    count1=0
   for j in 0..c.length-1
     if v.bit(120*j+i) == true
       count1 += 1
     end
   end
    if count1 >= 2000
      itemset1 << Set[i]
    end
  end
 
  b = itemset1
  k = 1
  while b != nil
    tmp = b
     x=Array.new
    for i in 0..b.length-1
       j=i+1
       while j < b.length-1 && (b[i]&b[j]).size == k-1
         x << (b[i] | b[j])
         j += 1
       end
     end
    y =Array.new
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
    b = y
    k += 1
    end
   tmp
end

def transform(t)
 f=open("mushroom2.dat") 
  c=Array.new
  r=Array.new(t.length)
    while (g = f.gets) != nil do
      d1,d2 =g.chomp.split(/ /)
      c[d1.to_i]=d2
    end
  for i in 0..r.length-1
    r[i]=c[t[i]]
  end
  r
end
    
    
    
    
