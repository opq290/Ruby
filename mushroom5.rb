load"sieve.rb"

def itemf(k)
 if k >=2
  a=item(k-1)
  f=Array.new
  
  for i in 0..a.length-2
   for j in i+1..a.length-1
     if (a[i]&a[j]).size ==k-2
       f << (a[i] | a[j]).sort
     end
    end
    end
   end
   f.uniq
end

def item(k)
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
 f=Array.new
 if k ==1
 atr=Array.new(120)
  for i in 0..atr.length-1
    atr[i]=0
  end
    for i in 0..c.length-1
      for j in 0..22
        atr[c[i][j]] += 1
      end
    end
    for i in 0..atr.length-1
      if atr[i] >= 2000
        f << [i]
      end
    end
   end
   
     if  k >=2
      
        b= itemf(k)
       if b != nil
        for i in 0..b.length-1
          count=0
          for j in 0..c.length-1
            if b[i].all?{|e| v.bit(e+120*j)==true} == true
              count +=1
            end
          end
         if count >= 2000
           f << b[i]
         end
        end
      end
  
     end
 
  f 
end

