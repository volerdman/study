module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
          films_array = array.select do |film|
            film['rating_kinopoisk'].to_f.positive? && film['country'].to_s.split(',').length > 1
          end

          array_map = films_array.map { |film| film['rating_kinopoisk'].to_f} 
          summ = array_map.reduce(:+)
          count = films_array.length
          summ / count
      end

      def chars_count(films, threshold)
        films_array = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        array_map = films_array.map { |film| film['name'].to_s }
        array_map.reduce(0) { |val, name| val + name.count('и') }
      end
    end
  end
end
