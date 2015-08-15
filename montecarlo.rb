def montecarlo(n)
  m=0
  for i in 1..n
    x=rand()
    y=rand()
    if x*x+y*y<1.0
      m=m+1
    end
  end
  m*1.0/n
end

def mcplot(n)
  a=make2d(500,500)
  for i in 1..n
    x=rand()
    y=rand()
    if x*x+y*y<1.0
      a[y
