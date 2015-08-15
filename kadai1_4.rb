load"pg10r.rb"
load"pg10.rb"

t=pg10r
u=Array.new(t.length)
for i in 0..u.length-1
  u[i]=t[i][1][0]
end

p [pg10[u.max],u.max]


  
