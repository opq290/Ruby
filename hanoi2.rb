include(Math)

class Disk
  attr_accessor("n","color")
  def initialize(m,diskcolor)
    self.n=m
    self.color=diskcolor
  end
  def draw(screen,x,y)
    for tower_x in -self.n..self.n
      screen[y][x+tower_x]=color
    end
  end
end

def make1d(n)
  x=Array.new(n)
  for i in 0..n-1
    x[i]=[0,0,0]
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

def dohanoi(hanoi_n)
  tower=Array.new(3)
  for i in 0..2
    tower[i]=Array.new(0)
  end
  for i in 1..hanoi_n
    tower[0].push Disk.new(hanoi_n+1-i,[0.0,1.0*(hanoi_n+1-i)/hanoi_n,0.0])
  end
  width=(hanoi_n*2+1)*3+4 
  height=hanoi_n+3 
  screen=make2d(height,width) 
  printf("Hanoi n=%d GO;",hanoi_n) 
  showscreen(hanoi_n,tower,width,height,screen) 
  gets()
  move(hanoi_n,0,1,2,hanoi_n,tower,width,height,screen)
end

def move(n,f,t,b,hanoi_n,tower,width,height,screen) 
  if n==0
    return
  else
    move(n-1,f,b,t,hanoi_n,tower,width,height,screen) 
    tower[t].push tower[f].pop 
    printf("from %d to %d;",f,t) 
    showscreen(hanoi_n,tower,width,height,screen) 
    gets() 
    move(n-1,b,t,f,hanoi_n,tower,width,height,screen) 
    return
  end
end
def showscreen(hanoi_n,tower,width,height,screen) 
  for x in 0..width-1
    for y in 0..height-1 
      screen[y][x]=[0,0,0]
    end
  end 
  for x in 0..2
    for y in 1..height-1 
      screen[y][(1+hanoi_n)*(2*x+1)]=[1.0,1.0,1.0]
    end
  end 
  for x in 0..width-1
    screen[height-1][x]=[1.0,1.0,1.0]
  end 
  for x in 0..2
    for tower_n in 0..tower[x].size-1 
      tower[x][tower_n].draw(screen,(1+hanoi_n)*(2*x+1),height-2-tower_n)
    end 
    show(screen)
  end
end
