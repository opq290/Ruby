require 'set'

def prime_number(k)
  p=SortedSet.new
  a=SortedSet.new
  n=SortedSet.new
  for i in 0..k
   n.add(i)
  end
  f=n-Set[0,1]-a-p
  while f.size > 0
   q=f.to_a.min
   p.add(q)
   for i in 2..k/q
     a.add(i*q)
   end
   f=n-Set[0,1]-a-p 
  end
  p p
end
  
  





