# 1. Create a function called generateArray() that
# generates an array of random integers, where the
# length of the array and the maximum random value are
# defined as parameters. For example, generateArray(5, 3)
# may generate the array [3, 2, 0, 1, 1]. Random values
# should be between 0 and the maximum random value inclusive.

module Test
  class ExerciseA

    def generateArray(lenght, maximum_value)
      # add your code here! :)
    end

  end
end


test = Test::ExerciseA.new
puts test.generateArray(5,3)

# output: [3, 2, 0, 1, 1]
