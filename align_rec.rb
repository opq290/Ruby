load("./max.rb")

def g()
  -2
end

def q(x,y)
  if x==y
    2
  else
    -1
  end
end

def align_sub(s,t,i,j)
  if i==0 || j==0
    i*g() + j*g()
  else
    v0 = align_sub(s,t,i,  j-1) + g()
    v1 = align_sub(s,t,i-1,j-1) + q(s[i-1],t[j-1])
    v2 = align_sub(s,t,i-1,j)   + g()
    max(v0,max(v1,v2))
  end
end

def align_rec(s,t)
  align_sub(s,t,s.length(),t.length())
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
