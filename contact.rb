class Contact
  attr_accessor("name","number","left","right")
  def initialize(name,number)
    self.name = name
    self.number = number
    self.left = nil
    self.right = nil
  end
end

def find_contact(p,n)
  if p.name == n
    p
  else
    if n < p.name
      find_contact(p.left, n)
    else
      find_contact(p.right, n)
    end
  end
end

def add_contact(p,q)
  if p == nil
    q
  else
    if q.name < p.name
      p.left = add_contact(p.left,q)
    else
      p.right = add_contact(p.right, q)
    end
    p
  end
end

def size(p)
  if p == nil
    0
  else
    1 + size(p.left) + size(p.right)
  end
end

def delete_contact(p, n)
  if p.name == n
    delete_root(p)
  else
    if n < p.name
      p.left = delete_contact(p.left,n)
    else
      p.right = delete_contact(p.right,n)
    end
    p
  end
end
  
def delete_root(p)
  if p.left == nil 
    p.right
  else
    if p.right == nil
      p.left
    else
      choose_root(p)
    end
  end
end

def choose_root(p)
  q = first_contact(p.right)
  r = delete_contact(p.right,q.name)
  q.left = p.left
  q.right = r
  q
end

# version 1.5
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
