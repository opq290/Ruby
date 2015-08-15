def maxHeapify(a,i)
  l = left(i)
  r = right(i)
  largest = -1
  if l < $heapSize and a[l] > a[i]
    largest = l
  else
    largest = i
  end
  if r < $heapSize and a[r] > a[largest]
    largest = r
  end
  if largest != i
    a[i], a[largest] = a[largest], a[i]
    maxHeapify(a,largest)
  end
end

def parent(i)
  return (i-1)/2
end

def left(i)
  return 2*i+1
end

def right(i)
  return 2*i+2
end

def buildMaxHeap(a)
  $heapSize = a.size
  i = a.length/2-1
  while i>=0
    maxHeapify(a,i)
    i -= 1
  end
end

def heapSort(a)
  buildMaxHeap(a)
  i = a.length-1
  while i >= 1
    a[0], a[i] = a[i], a[0]
    $heapSize -= 1
    maxHeapify(a,0)
    i -= 1
  end
end

def test
  a = [4,8,2,5,1,9]
  heapSort(a)
  print a*",","\n"
end

