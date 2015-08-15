# -*- coding: utf-8 -*-
def stops
  ["渋谷","神泉","東大前","駒場","池ノ上","下北沢"]
end

t = stops
print t*",", "\n"

i = t.index("東大前")
t[i..i+1] = ["駒場東大前"]
print t*",", "\n"
