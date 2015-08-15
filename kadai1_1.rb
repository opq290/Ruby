load"pg10.rb"
t=pg10
f=Hash.new
u=Array.new
x=Array.new
y=Array.new
for i in 0..t.length-1
  f[t[i]]=i
  u << [t[i],i]
end
x1=u.select{|e|"God"==e[0]}

for i in 0..x1.length-1
  x[i]=x1[i][1]
end
 y1=u.select{|e|"god"==e[0]}
for i in 0..y1.length-1
  y[i]=y1[i][1]
end

p "God"
p x
p "god"
p  y
