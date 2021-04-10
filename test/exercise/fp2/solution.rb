module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        array = self

        return array if array.empty?

        head, *tail = array

        yield head

        MyArray.new(tail).my_each(&func)

        array
      end

      # Написать свою функцию my_map
      def my_map
        func = ->(acc, val) { acc << yield(val) }

        empty_array = MyArray.new
        
        my_reduce(empty_array, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, val) { val.nil? ? acc : acc << val }

        empty_array = MyArray.new
        
        my_reduce(empty_array, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        array = self

        array.my_each do |val|
          acc = if acc.nil?
                  array.first
                else
                  yield(acc, val)
                end
        end
        acc
      end
    end
  end
end
