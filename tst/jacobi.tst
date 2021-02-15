# Test MyJacobi
gap> List([0..5], n -> MyJacobi(n, 5));
[ 0, 1, -1, -1, 1, 0 ]
gap> MyJacobi(0,0);
Error, <m> must be positive
