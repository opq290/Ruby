# -*- coding: utf-8 -*-
def stops
  ["渋谷駅","池尻大橋駅","三軒茶屋駅","駒沢大学駅","桜新町駅","用賀駅","二子玉川駅","二子新地駅","高津駅","溝の口駅","梶が谷駅","宮崎台駅","宮前平駅","鷺沼駅","たまプラーザ駅","あざみ野駅","江田駅","市が尾駅","藤が丘駅","青葉台駅","田奈駅","長津田駅","つくし野駅","すずかけ台駅","南町田駅","つきみ野駅","中央林間駅"]
end

def expressStops
  ["渋谷駅","三軒茶屋駅","二子玉川駅","溝の口駅","鷺沼駅","たまプラーザ駅","あざみ野駅","青葉台駅","長津田駅","中央林間駅"]
end

def number(stops,expressStops)
 a=Array.new(expressStops.length-1)
 b=Array.new(expressStops.length-1)
 k=0
 for i in 1..expressStops.length-1
  j=stops.index(expressStops[i])
  a[k]=j-k-1
  k=k+1
  end
 b[0]=a[0]
 for j in 1..b.length-1
   b[j]=a[j]-a[j-1]
 end
 b
end
b=number(stops,expressStops)
print b*",","\n"



