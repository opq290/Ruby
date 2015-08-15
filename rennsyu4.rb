# -*- coding: utf-8 -*-
def stops1
  ["渋谷駅","池尻大橋駅","三軒茶屋駅","駒沢大学駅","桜新町駅","用賀駅","二子玉川駅","二子新地駅","高津駅","溝の口駅","梶が谷駅","宮崎台駅","宮前平駅","鷺沼駅","たまプラーザ駅","あざみ野駅","江田駅","市が尾駅","藤が丘駅","青葉台駅","田奈駅","長津田駅","つくし野駅","すずかけ台駅","南町田駅","つきみ野駅","中央林間駅"]# 各停を使うと仮定する。
end

def stops2
  ["渋谷駅","表参道駅","青山一丁目駅","永田町駅","半蔵門駅","九段下駅","神保町駅","大手町駅","三越前駅","水天宮前駅","清澄白河駅","住吉駅","錦糸町駅","押上駅"]
end

def stops3
  ["浅草駅","業平橋駅","押上駅","曳舟駅","東向島駅","鐘ヶ淵駅","堀切駅","牛田駅","北千住駅","小菅駅","五反野駅","梅島駅","西新井駅","竹ノ塚駅","谷塚駅","草加駅","松原団地駅","新田駅","蒲生駅","新越谷駅","越谷駅","北越谷駅","大袋駅","せんげん台駅","武里駅","一ノ割駅","春日部駅","北春日部駅","姫宮駅","宮代町","東武動物公園駅"]
end

def stops4
  ["東武動物公園駅","杉戸高野台駅","幸手駅","南栗橋駅"]
end

def reverse(k)
 new=Array.new(k.length-1)
  for i in 0..k.length-1
  new[i]=k[k.length-i-1]
  end
new
end


def cross(line1,line2)
  for i in 0..line1.length-1
    if j=line2.index(line1[i])
      return [i,j]
    end
  end
end

def join(line1,line2)
  i,j=cross(line1,line2)
  line1[0..i]+line2[j+1..-1]
end


a=reverse(stops1)
b=join(a,stops2)
c=join(b,stops3)
d=join(c,stops4)
e=d[d.length/2]
print d*",","\n"
print e


