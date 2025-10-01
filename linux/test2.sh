clear 
g++ b.cpp -o b  || { echo "Compile Error"; exit 1; }
time ./b < test.inp > test.ans