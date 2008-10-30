#include <string>
#include <iostream>
#include <cmath>

#include "Evaluator.h"

using namespace std;

namespace FastEval {

  Evaluator::Evaluator()
  {
  }

  double Evaluator::Evaluate(const Expression* const expr, const double* values) {
    stack<double> st;
      
    const unsigned int nOps = expr->GetNOps();
    const op_t* ops = expr->GetOps();
    const op_t* endOps = ops + nOps;
    
    for (op_t* iOp = (op_t*)ops; iOp != endOps; ++iOp) {
      switch (iOp->type) {
        case eNumber:
          st.push(iOp->content);
          break;
        case eVariable:
          st.push(values[(unsigned int)iOp->content]);
          break;
        default:
          calcOp(st, iOp);
          break;
      };
    }
    return st.top();
  }

  void Evaluator::calcOp(stack<double>& st, const op_t* op) {
    register double v1;
    register double v2;
    switch (Expression::fgOpArity[op->type]) {
      case 2:
        v2 = st.top();
        st.pop();
      case 1:
        v1 = st.top();
        st.pop();
        break;
      default:
        cerr << "BARF!" << endl;
        break;
    };

    switch (op->type) {
      case B_SUM:
        st.push(v1+v2); break;
      case B_DIFFERENCE:
        st.push(v1-v2); break;
      case B_PRODUCT:
        st.push(v1*v2); break;
      case B_DIVISION:
        st.push(v1/v2); break;
      case U_MINUS:
        st.push(-v1); break;
/* These are fatal!
 *    case U_P_DERIVATIVE
        break;
      case U_T_DERIVATIVE
        break;
*/

      case B_EXP:
        st.push(pow(v1, v2)); break;
      case B_LOG:
        st.push(log(v2)/log(v1)); break;
      case U_SINE:
        st.push(sin(v1)); break;
      case U_COSINE:
        st.push(cos(v1)); break;
      case U_TANGENT:
        st.push(tan(v1)); break;

/*  
    1, // U_SINE,
    1, // U_COSINE,
    1, // U_TANGENT,
    1, // U_COTANGENT,
    1, // U_ARCSINE,
    1, // U_ARCCOSINE,
    1, // U_ARCTANGENT,
    1, // U_ARCCOTANGENT,
    1, // U_SINE_H,
    1, // U_COSINE_H,
    1, // U_AREASINE_H,
    1, // U_AREACOSINE_H,
    2, // B_ARCTANGENT_TWO,
*/
      default:
        cerr << "funny op" << endl;
        break;
    };
  }

} // end namespace FastEval

