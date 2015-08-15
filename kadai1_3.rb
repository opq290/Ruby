# -*- coding: utf-8 -*-
load"pg10r.rb"
t=pg10r
def find(u,m,s) # uのm番目の要素をキーとして二分探索する関数。
  i = 0
  j = u.length-1
  while i<=j
    k = (i+j)/2
    if u[k][m]==s
      return k
    else
      if u[k][m] < s
        i = k+1
      else
        j = k-1
      end
    end
  end
  return nil
end
 
k1=find(t,0,"god")
k2=find(t,0,"God")

p t[k1]
p t[k2]

