load("align_rec.rb")
def spell(dict,word)
 v=align_rec(dict[0],word) 
 k=0
  for i in 1..dict.length()-1
    if align_rec(dict[i],word)>v
      k=i
      v=align_rec(dict[i],word)
    else
      k=k
      v=v
    end
  end
 dict[k]
end
