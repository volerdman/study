module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each { |num| max = num if num > max }
        new_array = array.map { |num| num < 0 ? num : max }
      end

      def bin_search(arr, low, high, query)
        return -1 if low > high

        middle = (low + high) / 2

        if query == arr[middle]
          middle
        elsif query < arr[middle]
          high_new = middle - 1
          bin_search(arr, low, high_new, query)
        else
          low_new = middle + 1
          bin_search(arr, low_new, high, query)
        end
      end

      def search(array, query)
        return -1 if !array || !query

        return -1 if array.empty?

        first = 0
        last = array.length - 1

        bin_search(array, first, last, query)
      end
    end
  end
end
