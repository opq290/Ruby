def cantor(n)
  a=make1d(3**n)
subcantor(a,n,0)
  a
end

def subcantor(a,n,x)
  if n==0
    a[x]=1
  else
    subcantor(a,n-1,x)
    subcantor(a,n-1,x+2*3**(n-1))
  end
end
