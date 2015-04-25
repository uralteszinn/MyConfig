// Prog: random.h
// define a class for pseudorandom numbers.

namespace ifm {
  // class random: definition 
  class random {
  public:
    // POST: *this is initialized with the linear congruential
    //       random number generator
    //           x_i = ( a * x_{i-1} + c) mod m
    //       with seed x0. 
    random(const unsigned int a, const unsigned int c, 
	   const unsigned int m, const unsigned int x0);

    // POST: return value is the next pseudorandom number 
    //       in the sequence of the x_i, divided by m
    double operator()();

  private:
    const unsigned int a_; // multiplier
    const unsigned int c_; // offset
    const unsigned int m_; // modulus
    unsigned int xi_;      // current sequence element
  };
} // end namespace ifm
