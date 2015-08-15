# -*- coding: utf-8 -*-
load"pg10r.rb"
t=pg10r
k=1000
l=0
while k>=1000
for j in 0..t.length-1
   if t[j][1].length > k
      k=t[j][1].length
      l=j
     p [t[l][0],k]
     end
    t.delete_at(l)
  end
end

#["For", 1745]
 ["Israel", 2564]
 ["LORD", 6541]
 ["and", 38915]
 ["the", 62264]
