load("max.rb")
def g()
  -2
end

def q(c,d)
  if c==d
    return 2
  else
    return -1
  end
end
def align(s,t)
  m=s.length()
  n=t.length()
  a=make2d(m+1,n+1)
  a[0][0]=0
  for j in 1..n
    a[0][j]=a[0][j-1]+g()
  end
  for i in 1..m
    a[i][0]=a[i-1][0]+g()
  end
  for i in 1..m
    for j in 1..n
      v0=a[i][j-1]+g()
      v1=a[i-1][j-1]+q(s[i-1],t[j-1])
      v2=a[i-1][j]+g()
      a[i][j]=max(v0,max(v1,v2))
    end
   end
  a
end

