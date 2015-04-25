// Programm: integer.h
// defines integer numbers of arbitrary size

#include <istream>
#include <ostream>
#include <deque>

namespace ifm {

  class integer {

  public:
    // constructors
    // ------------
    integer();                 // 0
    integer(int i);            // i
    integer(unsigned int i);   // i
    integer(float f);          // f     
    integer(double d);         // d 

    // arithmetic operators (with the standard semantics)
    // --------------------------------------------------
    integer  operator-() const;   
    integer& operator+=(const integer& x);
    integer& operator++();
    integer  operator++(int);
    integer& operator-=(const integer& x);
    integer& operator--();
    integer  operator--(int);
    integer& operator*=(const integer& x);
    integer& operator/=(const integer& x);
    integer& operator%=(const integer& x);
   
    // global friend operators
    // -----------------------
    friend bool operator==(const integer& x, const integer& y);
    friend bool operator<(const integer& x, const integer& y);
    friend std::ostream& operator<<(std::ostream& o, const integer& x);
    friend std::istream& operator>>(std::istream& i, integer& x);

  private:  
    // typedefs
    // --------
    typedef std::deque<unsigned int>     Seq;
    typedef Seq::iterator                It;
    typedef Seq::const_iterator          Cit;
    typedef Seq::const_reverse_iterator  Crit;

    // data members
    // ------------
    // an integer is represented by a base, a sign, and a sequence
    // of digits in the given base.

    // the base must be a power of 10 to facilitate decimal input and output
    static const unsigned int power_ = 4;
    static const unsigned int base_ = 10000;
   
    // the sign
    bool sign_; // false <=> negative

    // the sequence
    Seq seq_;
    // represents the nonnegative number
    // 
    //  \sum_{i=0}^{seq_.size()-1} seq_[i]*base_^i
    // The number 0 is represented by a length-1-sequence with seq_[0] == 0

    // private member functions
    // ------------------------
  
    // PRE: seq_ is empty
    // POST: seq_ is initialized to represent the number i  
    void init(unsigned int i);

    // POST: return value is true iff |*this| < |x|.
    bool abs_less(const integer& x) const;

    // POST: seq_ is updated to represent |*this| + |x|    
    integer& add(const integer& x);

    // PRE: |x| <= |*this|
    // POST: seq_ is updated to represent |*this| - |x|
    integer& subtract(const integer& x);

    // PRE: *this != 0, x < base_
    // POST: seq_ is updated to represent |*this| * |x|
    integer& mult(unsigned int x);
    
    // PRE: x != 0
    // POST: *this is replaced by the remainder of the division
    //       of *this by x; r holds the result of the division
    integer& div(const integer& x, integer& r);

    // PRE: s >= 0
    // POST: *this is multiplied by base_^s
    integer& leftshift (int s);

    // POST: returns true true iff highest significand digit is nonzero
    bool is_normalized() const;

    // POST: returns true iff *this has value 0
    bool is_zero() const;
  };

  // global operators
  // ----------------
  bool operator!=(const integer& x, const integer& y);
  bool operator<=(const integer& x, const integer& y);
  bool operator>(const integer& x, const integer& y);
  bool operator>=(const integer& x, const integer& y);

  integer operator+(const integer& x, const integer& y);
  integer operator-(const integer& x, const integer& y);
  integer operator*(const integer& x, const integer& y);
  integer operator/(const integer& x, const integer& y);
  integer operator%(const integer& x, const integer& y);
}
