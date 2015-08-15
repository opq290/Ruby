load"pg10.rb"
t=pg10.reverse

f=Hash.new([])
for i in 0..t.length-1
    f[t[i]]=i
end

k= f.values
p t[k.min]

  





  



