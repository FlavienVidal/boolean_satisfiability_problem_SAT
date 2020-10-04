int: nc;
enum Vertices;
set of int: NbEdges;
array[NbEdges] of Vertices: Edges1;
array[NbEdges] of Vertices: Edges2;

set of int: colors = 1..nc;

array[Vertices, colors] of var bool: statescolors;

constraint forall(i in NbEdges, j in colors)(
    (not statescolors[Edges1[i], j] \/ not statescolors[Edges2[i], j])
);

predicate atmostone(array[int] of var bool:x) =
          forall(i,j in index_set(x) where i < j)(
            (not x[i] \/ not x[j]));

predicate exactlyone(array[int] of var bool:x) =
          atmostone(x) /\ exists(x);

constraint forall (k in Vertices)(
    exactlyone(i in colors)((statescolors[k, i]))
);


solve satisfy;

output ["Each of the digit corresponds to a given color. For example a digit at the first place corresponds to color 1 whereas a digit at the 6th position corresponds to color 6.\n"];
output ["Color of " ++ show(k) ++ " is " ++ show(bool2int(statescolors[k, 1])) ++ show(bool2int(statescolors[k, 2])) ++ show(bool2int(statescolors[k, 3])) ++ "\n"  | k in Vertices];

