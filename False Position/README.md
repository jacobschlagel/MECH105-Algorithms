# False Position Function
This algorithm takes an inputted function, and uses a false position technique to find the roots of that function.
The algorithm can run for a specific amount of iterations, or until a desired relative error has been reached. Bracket a location where
a root is believed to be, and the algorithm will come up with a precise approximation for the root, and the function evaluated at that approximation.

### Inputs
   * func=the function being evaluated.
   * xl=the lower x bound that brackets a root.
   * xu=the upper bound that brackets a root.
   * es=the desired relative error to be met.
   * iter=the desired number of iterations to be ran.
   
### Outputs 
   * root=the estimated root location, an x value.
   * fx=the function evaluated at the root location.
   * ea=the approximate relative error.
   * iter=how many iterations were performed.

### Limitations
This is a closed method, and there MUST be both an upper and lower bound inputted.
