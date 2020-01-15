$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  result = []
  director_index = 0
  while director_index < source.size do
    result[director_index] = source[director_index][:name]
    director_index += 1
  end
  result
end

def total_gross(source)
  hash_directors_total = directors_totals(source)
  array_Directors = list_of_directors(source)
  array_index = 0
  running_total = 0
  while array_index < array_Directors.size do 
    running_total += hash_directors_total[array_Directors[array_index]]
    array_index += 1
  end
  running_total
end


