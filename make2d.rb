def make1d(n)
 a= Array.new(n)
  for i in 0..n-1
    a[i]=0
  end
  a
end

def make2d(h,w)
  a=Array.new(h)
  for i in 0..h-1
    a[i]=make1d(w)
  end
  a
end


