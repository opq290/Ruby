load("divisible.rb")
def gd(k,n)
  if divisible(k,n)
    n
  else
    gd(k,n-1)
  end
end
