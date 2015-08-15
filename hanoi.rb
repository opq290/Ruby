def hanoi(n,f,t,b) #fからtに移す　bは空いてる
  if n==0
   ""
  else
    hanoi(n-1,f,b,t)+"from"+f+"to"+t+";"+hanoi(n-1,b,t,f)
  end
end

def hanoi_times(n)
  if n==0
    0
  else
    hanoi_times(n-1)+1+hanoi_times(n-1)
  end
end

