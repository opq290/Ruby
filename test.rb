
def hanoi(n,a,b,c)
  if n>0 then
    hanoi(n-1,a,c,b)
    printf("a=%d->b=%d\n",a,b)
    gets()
    hanoi(n-1,c,b,a)
  end
end
