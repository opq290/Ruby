def hanoi(n,a,b,c)
  if n>0
    hanoi(n-1,a,c,b)
    move(n,a,b)
    hanoi(n-1,c,b,a)
   end
end

def move(n,s,d)
  pie[sp[d]][d]=pie[sp[s]-1][s]
  sp[d]+1
  sp[s]-1
  printf("\No.%ddisk is moved. %c-->%c\n",n,'a'+s, "a"+d)
  for i (N-1)..0
    for j 0..3
      if i<sp[j]
        printf("%8d",pie[i][j])
      else
        printf("         ")
        printf("\n")
       printf("\n       a       b       c\n")
        gets()
      end
     end
  end
end
