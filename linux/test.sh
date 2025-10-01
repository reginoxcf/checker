clear
g++ a.cpp -O2 -o a  || { echo "Compile Error"; exit 1; }
time ./a < test.inp > test.out
