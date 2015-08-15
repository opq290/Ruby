# -*- coding: utf-8 -*-
load"Yamanotesen.rb"
u = stops
i = 0
while u[i] != "渋谷駅" # 回数が分からない場合はwhileを使う
  i += 4
  i %= u.length       # i < u.lengthの場合は値はそのまま
  print u[i],"\n"
end
