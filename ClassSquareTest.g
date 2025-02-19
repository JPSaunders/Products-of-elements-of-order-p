ClassSquareTest := function(G)
local ans, CC, CT, Cx, i, n, ord, p, tmp;
if IsCharacterTable(G) then CT := G;
  else CT := CharacterTable(G);
fi;
n := NrConjugacyClasses(CT);
ord := OrdersClassRepresentatives(CT);
CC := Filtered([1..n],x->IsPrime(ord[x]) and ord[x] <> 2);
for i in CC do
  p := PrimeDivisors(ord[i])[1];
  Cx := Filtered([1..n], x -> PrimeDivisors(ord[x]) <> [p]);
  tmp := Filtered(Cx, y -> ClassMultiplicationCoefficient(CT, i, i, y) = 0);
  if tmp = Cx then
    Add(ans, tmp);
  fi;
od;
if ans = [] then return true;
else Print(ans,"\n"); return false;
fi;
end;
