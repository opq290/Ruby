# -*- coding: utf-8 -*-

load"pg10.rb"
bible=pg10
def swap(u,i,k) # 配列中のi番目とk番目のデータの入れ替え
  tmp = u[i]
  u[i] = u[k]
  u[k] = tmp
end
def mergesort(u,m)
  n=u.length()
  from=Array.new(n)
  for i in 0..(n-1)
    from[i]=u[i]
  end
  while n>1
    to=Array.new((n+1)/2)
    for i in 0..(n/2-1)
      to[i]=merge(from[i*2],from[i*2+1],m)
    end
    if !is_even(n)
      to[(n+1)/2-1]=from[n-1]
    end
    from=to
    n=(n+1)/2
    end
    from[0]
  end
def merge(a,b,m)
  c=Array.new(a.length()+b.length())
  ia=0
  ib=0
  ic=0
  while ia <a.length() && ib<b.length()
    if a[ia][m] <b[ib][m]
      c[ic]=a[ia]
      ia=ia + 1
      ic= ic+1
    else
      c[ic]=b[ib]
      ib=ib+1
      ic=ic+1
    end
  end
  if ia<a.length()
    for i in ia..(a.length()-1)
      c[ic]=a[i]
        ic=ic+1
    end
  else
   if ib<b.length()
  　　for i in ib..(b.length())
  　　　 c[ic]=b[i]
   　　　ic=ic+1
      end
    end
  end
  c
end
   
def genIndex(t) # 索引を作る
  u = Array.new
  for i in 0..t.length-1
    u[i] = [t[i],i] # [ ..., ["東大前",2], ... ]のようにキーと元の位置をペアにしておく。
  end
  return sort(u,0) # 0番目をキーとしてソートする
end

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

def begin



t = genIndex(bible) # 位置の情報もつけてソートする
for i in 0..t.length-1
  print t[i][0],",",t[i][1],"\n" # データを表示
end
i = find(t,0,"God") # 0番目をキーとして検索
p t[i][1] # 元の位置を表示
