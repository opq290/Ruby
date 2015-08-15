# -*- coding: utf-8 -*-
 
class Bintree2
  def initialize(key,data)
    @key = key             # キーと、
    @data = data           # データを保存
    @left = nil
    @right = nil           # とりあえず葉としておく
  end

 
def search(e)                    
    if e < @key
      if @left == nil
        nil
      else
        @left.search(e)
      end
    else
      if e > @key
        if @right == nil || @right.key > e
          self
        else
          @right.search(e)
        end
      else
        self
      end
    end
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
 def key
   @key
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
          n = root.search(-a)                               # 符号を変えて検索
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

def test2 #5,8,3
  a=Bintree2.new(5,"five")
  a.insert(8,"eight")
  a.insert(3,"three")
p a.search(7)

end
 def test3 #3,5,8
   b=Bintree2.new(3,"three")
   b.insert(5,"five")
   b.insert(8,"eight")
p b.search(7)
p b.search(4)
p b.search(9)
end

def test4 #8,5,3
  c=Bintree2.new(8,"eight")
  c.insert(5,"five")
  c.insert(3,"three")
p c.search(7)
p c.search(4)
p c.search(9)
end
