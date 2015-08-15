load("divisible.rb")
def gd_loop(k,n)
  while !divisible(k,n)
    n=n-1
  end
  n
end
