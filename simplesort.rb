def min_index(a,i)
  min=i
  for j in i..(a.length()-1)
   if a[j] < a[min] 
   min = j
   end 
  end
min  
end

def simplesort(a) 
  for i in 0..(a.length()-1)
    k = min_index(a, i) 
    tmp = a[i] 
   a[i] = a[k] 
   a[k] = tmp]
  end
a 
end
