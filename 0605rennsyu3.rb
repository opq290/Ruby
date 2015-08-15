# -*- coding: utf-8 -*-

class Bintree2
  def initialize(key,data)
    @key = key             # キーと、
    @data = data           # データを保存
    @left = nil
    @right = nil           # とりあえず葉としておく
  end

 def searchRng(s,t,res)
   res = Array.new
  for i in s.ceil..t.truncate
    if searchle(i) != nil
    res << searchle(i).data
    end
  end
   res.uniq
 end
  

  def insert(e,d)                                 # キー(e)のデータ(d)を挿入
    if e < @key                                         # 頂点のキーより小さいものは左の子孫にある
      if @left == nil
        @left = Bintree2.new(e,d)  # 左の子がなければ、そこに頂点を作って登録
      else
        @left.insert(e,d)                         # そうでなければ左の子(の下に)再帰的に挿入
      end
    else
      if e > @key                                    # 右の場合
        if @right == nil
          @right = Bintree2.new(e,d)
        else
          @right.insert(e,d)
        end
      end
    end                              # 既にある頂点のキーと一致した場合は変更しないことにする
  end

  def data # データのアクセッサー
    @data
  end
  

  def searchle(e)                    
     if e < @key
       if @left == nil
         nil
       else
         @left.searchle(e)
      end
    else
      if e > @key
        if @right == nil 
          self
        else
         if tmp = @right.searchle(e)
           tmp
         else
          self
         end
        end
     else  
      self
     end
    end
  end
end





def test
  root = Bintree2.new(0,"") # 以下で、root.insertができるように、ダミーの根を作っておく。
  while true
    print "key=" # キーを入力
    line = gets.chomp # １行入力して改行を除く
    if line != ""
      a = line.to_i  # 数値に変換し、
      if a>0                                 # 正だったら、挿入
        print "data="                       # データを入力
        line = gets.chomp
        if line != ""
          root.insert(a,line)                   # それを挿入する
        else
          print "data must be a word\n"             # データがなければエラー表示
        end
      else
        if a<0                                               # 負だったら、検索
          n = root.searchle(-a)                               # 符号を変えて検索
          if n != nil
            print "data=",n.data,"\n"          # 見つかったら表示           
          else
            print "data for key=",-a," not found\n" # 見つからなかったらエラーを表示
          end
        else
          break                                                   # 0だったら終了
        end
      end
    else
      print "key must be a number"    # 次が整数でない場合
    end
  end
end

def test2
 res=Array.new 
 b=Bintree2.new(3,"three")
   b.insert(5,"five")
   b.insert(8,"eight")
b.searchRng(2.8,7.5,res)
end



  

  
