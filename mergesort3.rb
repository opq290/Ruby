# -*- coding: utf-8 -*-
def is_even(n)
n%2==0
end

def mergesort(u,m)
  n=u.length()
  from=Array.new(n)
  for i in 0..(n-1)
    from[i]=[u[i]]
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
  while ia < a.length() && ib<b.length()
    if a[ia][m] < b[ib][m]
       c[ic]=a[ia]
       ia=ia + 1
       ic= ic+1

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
   
