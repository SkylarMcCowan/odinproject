# Fibonacci sequence using recursion
def fibonacci(n)
  return n if n <= 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

# Merge Sort algorithm
def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..])

  merge(left, right)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

# Example usage
puts "Fibonacci(10): #{fibonacci(10)}"
array = [38, 27, 43, 3, 9, 82, 10]
puts "Original array: #{array}"
puts "Sorted array: #{merge_sort(array)}"