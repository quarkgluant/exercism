class FlattenArray
  class << self
    def flatten(array)
      recurse_flatten(array, []).compact
    end

    private

    def recurse_flatten(array, flatten_array)
      array.each_with_object(flatten_array) do |item, array|
        if item.is_a? Array
          recurse_flatten(item, array)
        else
          array << item
        end
      end
    end
  end

end
