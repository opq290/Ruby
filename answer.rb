

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
