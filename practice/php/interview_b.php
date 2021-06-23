<?php
/*
	Create a function called findDuplicates() that takes
	the array of integers as input and returns the duplicates
	of that array as output. For example, findDuplicates([3, 3, 2, 1, 1, 3]) would return [1,3].
*/

class InterviewB
{

    function find_duplicates($input_array)
    {
        return $input_array;
    }

}

$input_array = [3, 3, 2, 1, 1, 3];
$interview = new InterviewB();
$result = $interview->find_duplicates($input_array);
var_dump($result);
# output: [1,3]
