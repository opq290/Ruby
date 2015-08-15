def gj(a)
  row=a.length()
  col=a[0].length()
  for k in 0..(col-2)
    akk=a[k][k]
    for i in 0..(col-1)
      a[k][i]=a[k][i]*1.0/akk
    end
    for i in 0..(row-1)
      if i!=k
        aik=a[i][k]
        for j in k..(col-1)
          a[i][j]=a[i][j]-aik*a[k][j]
        end
       end
     end
   end
  a
end

def abs(t)
  if t>=0
    t=t
  else
    t=-t
  end
end
def gjp(a)
  row=a.length()
  col=a[0].length()
  for k in 0..(col-2)
   max=maxrow(a,k)
   swap(a,k,max)
    akk=a[k][k]
    for i in 0..(col-1)
      a[k][i]=a[k][i]*1.0/akk
    end
    for i in 0..(row-1)
      if i!=k
        aik=a[i][k]
        for j in k..(col-1)
          a[i][j]=a[i][j]-aik*a[k][j]
        end
       end
     end
   end
  a
end

   
def maxrow(a,k)
  m=k
 row=a.length()
  for i in k..(row-1)
    if abs(a[i][k])>abs(a[m][k])
      m=i
    else
      m=m
    end 
  end
  m
end

def swap(a,k,max)
 v=a[k]
 a[k]=a[max]
 a[max]=v
 a
end
