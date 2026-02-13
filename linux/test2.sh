g++ b.cpp -std=c++17 -lm -O2 -o b  || { echo "Compile Error"; exit 1; }
# /usr/bin/time -f "Time: %Us" ./b < test.inp > test.ans
ts=$(date +%s%N)
./b < test.inp > test.ans
echo $'Time:' $((($(date +%s%N) - $ts)/1000000)) $'ms'
