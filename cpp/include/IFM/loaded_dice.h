// Prog: loaded_dice.h 
// define a class for rolling a loaded dice.

#include <IFM/random.h>

namespace ifm {
  // class loaded_dice: definition 
  class loaded_dice {
  public:
    // PRE: p1 + p2 + p3 + p4 + p5 <= 1
    // POST: *this is initialized to choose the number
    //       i in {1,...,6} with probability pi, according 
    //       to the provided random number generator; here, 
    //       p6 = 1 - p1 - p2 - p3 - p4 - p5
    loaded_dice (double p1, double p2, double p3, double p4, 
		 double p5, ifm::random& generator);
  
    // POST: return value is the outcome of rolling a loaded
    //       dice, according to the probability distribution
    //       induced by p1,...,p6
    unsigned int operator()();
  
  private:
    // p_upto_i is p1 + ... + pi
    const double p_upto_1;
    const double p_upto_2;
    const double p_upto_3;
    const double p_upto_4;
    const double p_upto_5;
    // the generator (we store an alias in order to allow 
    // several instances to share the same generator)
    ifm::random& g; 
  };
} // end namespace ifm
