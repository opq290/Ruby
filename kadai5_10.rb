def f(s)
f=s.to_a
  f
end

def g(s)
 f=f(s)
 g=Array.new
  for i in 0..f.length-1
    g[f[i]]=i
  end
  g
end

def in(a,s)
  g=g(s)
  if g[a] != nil
    return true
  else
    return false
  end
end


  
