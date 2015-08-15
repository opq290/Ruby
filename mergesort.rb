def is_even(n)
n%2==0
end

def mergesort(a)
  n=a.length()
  from=Array.new(n)
  for i in 0..(n-1)
    from[i]=[a[i]]
  end
  while n>1
    to=Array.new((n+1)/2)
    for i in 0..(n/2-1)
      to[i]=merge(from[i*2],from[i*2+1])
    end
  if !is_even(n)
    to[(n+!)/2-1]=from[n-1]
  end
  from=to
  n=(n+1)/2
  end
  from[0]
end

def merge(a,b)
  c=Array.new(a.length()+b.length())
  ia=0
  ib=0
  ic=0
  while ia<a.length()&&ib<b.length()
    if a[ia]<b[ib]
      c[ic]=a[ia]
      ia=ia+1
      ic=ic+1
    end
  end
end
