load"pg10_1000.rb"
t=pg10_1000
f=Hash.new([])

for i in 0..t.length-1
  f[t[i]]<<i
    
end
print f["god"]
