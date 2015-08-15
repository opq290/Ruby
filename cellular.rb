load("./make2d.rb")

def y(p,q)
  if q<0
   q+p
  else
    if q>p
      q-p
    else
      q
    end
  end
end

def cellular(height,width)
  a=make2d(height,width)
  a[0][width/2]=1
  for i in 1..(height-1)
    for j in 0..(width-1)
      if( a[i-1][y(width,j-2)] + a[i-1][y(width,j-1)] + a[i-1][y(width,j)] + a[i-1][y(width,j+1)] + a[i-1][y(width,j+2)]) == 1
         a[i][j]=1
      else
         a[i][j]=0
      end
    end
  end
  a
end

