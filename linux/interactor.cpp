#include <bits/stdc++.h>
#define ll long long
#define ld long double
#define all(v) begin(v), end(v)
#define pi pair<int, int>
#define vi vector<int>
using namespace std;
mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());
ll rd(ll l, ll r){ return rng() % (r-l+1) + l;}
//VARIABLES
int QLIM; //query limit
//TEST GENERATOR
void gen(){

}

//TEST PRINTER
void print(){
  //print to stderr
}

int main(){
  ios_base::sync_with_stdio(0); cin.tie(0);
  gen(); print();
  //print everything to stdout
  int queries = 0;
  while(true){
    string qt; cin >> qt;
    if(qt == "?"){
      queries++;
      if(queries > QLIM){exit(2);}

    }
    else if(qt == "!"){

    }
    else{
      exit(3);
    }
  }
  cout.flush();
  return 0;
}

/*
EXIT CODES
0: AC
1: WA
2: Query limit exceeded (QLE)
3: Query error (QE)
*/