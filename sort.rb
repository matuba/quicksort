# coding: utf-8
require 'pry'
class Qsort
  attr_accessor :ary

  def initialize(ary)
    @ary = ary
  end

  def sort(b, e)
    while(true)
      ret = swap(b, e)
      if ret[0] < ret[1] && @ary[ret[0]] == @ary[ret[1]]
        break
      end

      if ret[0] >= ret[1]
        div = ret[0] - 1
        if div - b >= 1
          sort(b, div)
        end

        if e - (div + 1) > 1
          sort(div + 1, e)
        end
        break
      end
    end
  end

  def getPivot(b, e)
    len= e -b + 1
    @ary[b + (len / 2)]
  end

  def swap(b, e)
    len = e - b
    pivot= getPivot(b, e)
    left = searchLeft(pivot, b, e)
    right = searchRight(pivot, b, e)

    if left < right
     work = @ary[left]
     @ary[left] = @ary[right]
     @ary[right] = work
    end
#      binding.pry

    [left, right]
  end

  def searchLeft(pivot, b, e)
    n = b
    while(n < e)
      if @ary[n] < pivot
        n += 1
        next
      end
      break
    end
    n
  end

  def searchRight(pivot, b, e)
    n = e
    while(n >= b)
      if pivot < @ary[n]
        n -= 1
        next
      end
      break
    end
    n
  end
end
