module BookKeeping
  VERSION = 2
end

class Integer
  def to_roman
    rank = self.digits.reverse.length
    res = []
    self.digits.reverse.each do |number|
      ten, half, unit = case rank
                        when 4
                          [nil, nil, 'M']
                        when 3
                          ['M', 'D', 'C']
                        when 2
                          ['C', 'L', 'X']
                        when 1
                          ['X', 'V', 'I']
                        end
      roman = case number
              when (1..3) then
                "#{unit}" * number
              when 4 then
                "#{unit}" + "#{half}"
              when 5 then
                "#{half}"
              when (6..8) then
                "#{half}" +  "#{unit}" * (number - 5)
              when 9 then
                "#{unit}" + "#{ten}"
              when 10 then
                "#{ten}"
              end
      res << roman
      rank -= 1
    end
    res.join
  end
end
