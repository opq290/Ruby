def sum3(image,x)
  sum=image[x]
  if x>0
    sum += image[x-1]
  end
  if x<image.length()-1
    sum +=　image[x+1]
  end
  sum
end

def length(image,x)
  area=1
  if x>0
    area += 1
  end
  if x<image.length()-1
    area += 1
  end
  area
end

def image_aberage(image,x,y)
  area=length3(image
