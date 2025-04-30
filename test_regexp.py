import re
from regexp import parse, accept 

count = 0

print("")
print("Tests:")

def run_test(test_num, input_str, expected):
    global count
    ans = accept(parse(input_str))
    if ans == expected:
        print(f"{test_num}. Passed")
        count += 1
    else:
        print(f"{test_num}. Failed, the word is not part of the list")

# Running tests
run_test(1, "Eldarin", "Eldarin")
run_test(2, "Elear", "Elear")
run_test(3, "Elenion", "Elenion")
run_test(4, "Emyn", "Emyn")
run_test(5, "Eleniion", "No match")
run_test(6, "Emy", "No match")
run_test(7, "Elarin", "No match")
run_test(8, "XYZ", "No match")
run_test(9, "Elenya", "Elenya")
run_test(10, "Elen", "Elen")
run_test(11, "", "No match")
run_test(12, "E", "No match")
run_test(13, "E@lenion", "No match")
run_test(14, "E1234", "No match")
run_test(15, "eldarin", "No match")
run_test(16, "ElDarIn", "No match")
run_test(17, " Eldarin", "No match")
run_test(18, "El darin", "No match")
run_test(19, "ElearX", "No match")
run_test(20, "Eleni", "Eleni")

print("Passed", count, "of 20 tests")
