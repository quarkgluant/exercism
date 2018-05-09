module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Year
  def self.leap?(year_to_test)
    (year_to_test % 4 == 0 && 
    year_to_test % 100 != 0) ||
    (year_to_test % 4 == 0 && 
    year_to_test % 100 == 0 &&
    year_to_test % 400 == 0)
  end
end