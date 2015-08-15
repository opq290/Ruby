
def make1d(n)
  x=Array.new(n)
  for i in 0..n-1
    x[i]=0
  end
  x
end

def make2d(m,n)
  x=Array.new(m)
  for i in 0..m-1
    x[i]=make1d(n)
  end
  x
end

def dohanoi(h_n)
  tower=Array.new(3)
  for i in 0..2
    tower[i]=Array.new(h_n)
  end
  for i in 0..h_n-1
    tower[0][i]=h_n-i
	
	
    tower[1][i]=0
    tower[2][i]=0
  end
  width=(h_n*2+1)*3+4
  height=h_n+3
  screen=make2d(height,width)
  printf("Hanoi n=%d go;",h_n) 
  draw(h_n,tower,width,height,screen)
  gets()
  move(h_n,0,1,2,h_n,tower,width,height,screen)
end

def move(n,f,t,b,h_n,tower,width,height,screen)
  if n==0
    return
  else
    move(n-1,f,b,t,h_n,tower,width,height,screen)
    forend=false
    for i in 0..h_n-1
      if tower[t][i]==0 && forend==false
        for j in 0..h_n-1
          if tower[f][h_n-1-j]!=0 && forend==false
            tower[t][i]=tower[f][h_n-1-j]
            tower[f][h_n-1-j]=0
            forend=true
          end
        end
      end
    end
    printf("from %d to %d;",f,t)
    draw(h_n,tower,width,height,screen)
    gets()
    move(n-1,b,t,f,h_n,tower,width,height,screen)
    return
  end
end

def draw(h_n,tower,width,height,screen)
  for x in 0..width-1
    for y in 0..height-1
      screen[y][x]=0.0
    end
  end
  for x in 0..2
    for y in 1..height-1
      screen[y][(1+h_n)*(2*x+1)]=0.5
    end
  end
  for x in 0..width-1
    screen[height-1][x]=0.5
  end
  for x in 0..2
    for tower_n in 0..h_n-1
      if tower[x][tower_n]!=0
        for tower_x in -tower[x][tower_n]..tower[x][tower_n]
          screen[height-2-tower_n][(1+h_n)*(2*x+1)+tower_x]= 1.0
        end
      end
    end
  end
  show(screen)
end
