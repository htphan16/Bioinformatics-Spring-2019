#! /bin/bash
# 1. Retrieve all dat files using curl command
curl -O https://cs.earlham.edu/~charliep/courses/BioI/first.dat
curl -O https://cs.earlham.edu/~charliep/courses/BioI/second.dat
curl -O https://cs.earlham.edu/~charliep/courses/BioI/third.dat
# 2. Extract all sequences from first.dat and second.dat that contain
# the string "AACCTTNN" to a file called "fourth.dat"   
grep "AACCTTNN" first.dat >> fourth.dat
grep "AACCTTNN" second.dat >> fourth.dat
# 3. Copy contents of fourth.dat to a file called fifth.dat, then append
all contents from third.dat to fifth.dat
cp fourth.dat fifth.dat
cat third.dat >> fifth.dat
# 4. Display the number of lines, words, characters in fifth.dat
wc fifth.dat
# 5. Extract all lines in fifth.dat that do not contain the string "AACCTTNN"
# to a file called sixth.dat 
grep -v "AACCTTNN" fifth.dat >> sixth.dat
# 6. Using one command line, display only the number of lines in fourth.dat
# and sixth.dat 
wc -l fourth.dat sixth.dat
# 7. Using one command line, extract sequences in {first, second, third}.dat
# that contain ATG but do not contain TAG to a file called seventh.dat
grep "ATG" first.dat second.dat third.dat | grep -v "TAG" >> seventh.dat
# 8. Using one command line, extract sequences in {first, second, third}.dat
# that contain ATG and contain TAG to a file called eighth.dat  
grep "ATG" first.dat second.dat third.dat | grep "TAG" >> eighth.dat
# 9. Using one command line, display only the number of lines in seventh.dat
# and eighth.dat
wc -l seventh.dat eighth.dat
