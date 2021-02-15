#
# TestActionPackage: Minimal package to try out gap-actions
#
# Implementations
#
InstallGlobalFunction( TestActionPackage_Example,
function()
	Print( "This is a placeholder function, replace it with your own code.\n" );
end );

BindGlobal("MyJacobi", function ( n, m )
  local  jac, t;

  # check the argument
  if m <= 0 then
    Error("<m> must be positive");
  fi;

  # compute the Jacobi symbol similar to Euclid's algorithm
  jac := 1;
  while m <> 1  do

    # if the gcd of $n$ and $m$ is $>1$ Jacobi returns $0$
    if n = 0 or (n mod 2 = 0 and m mod 2 = 0)  then
      jac := 0;  m := 1;

    # $J(n,2*m) = J(n,m) * J(n,2) = J(n,m) * (-1)^{(n^2-1)/8}$
    elif m mod 2 = 0  then
      if n mod 8 = 3  or  n mod 8 = 5  then jac := -jac;  fi;
      m := m / 2;

    # $J(2*n,m) = J(n,m) * J(2,m) = J(n,m) * (-1)^{(m^2-1)/8}$
    elif n mod 2 = 0  then
      if m mod 8 = 3  or  m mod 8 = 5  then jac := -jac;  fi;
      n := n / 2;

    # $J(-n,m) = J(n,m) * J(-1,m) = J(n,m) * (-1)^{(m-1)/2}$
    elif n < 0  then
      if m mod 4 = 3  then jac := -jac;  fi;
      n := -n;

    # $J(n,m) = J(m,n) * (-1)^{(n-1)*(m-1)/4}$ (quadratic reciprocity)
    else
      if n mod 4 = 3  and m mod 4 = 3  then jac := -jac;  fi;
      t := n;  n := m mod n;  m := t;

    fi;
  od;

  return jac;
end);
