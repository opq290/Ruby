def f(x)
  1/(1+x**2)
end

def pi(n)
4.0*simposon(0,1,n)
end

def simposon(xs,xe,n)
  deltax=(xe-xs)*1.0/(n*2.0)
  sum=f(xs)+4*f(xs+deltax)+f(xe)
  for i in 1..(n-1)
    sum=sum+(2*f(xs+2*i*deltax)+4*f(xs+(2*i+1)*deltax))
  end
  deltax*sum/3.0
end
