def often(seq,max=100,
          item   = lambda x: x,
          weight = lambda x: x.priority) :
    total = 0
    for x in seq: total += weight(x)
    while True:
        max -= 1
        if max < 0 : break
        chosen = random.uniform(0, total)
        count  = 0
        for x in seq:
            count += weight(x)
            if count > chosen:
                yield item(x)
                break

def upperp(w):
	return w[0].isupper() # True

_nth=0

class Object:
  def create(i) :
   i.txt=i.__class__.__name__
   i.id = _id = _id + 1

class Phone(Object):
  id  = nth()
  def __init__(i):
    i.Calls  = True
    i.Gps    = Some(0,1,excludes("Screen","Basic"))
    i.Screen = Or("Basic","Color","HighRes")

class Screen:
   i.
