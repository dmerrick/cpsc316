(* some basic functions for examples *)
fun inc(n) = n + 1;
fun square(n) = n * n;
fun twice(f,x) = f(f(x));
fun add(a,b) = a + b;

(* 5.4a *)
(* define the tree datatype *)
datatype 'a tree = LEAF of 'a |
NODE of 'a tree * 'a tree;

(* function definition *)
fun maptree(f,(LEAF(n))) = LEAF(f(n))
  | maptree(f,(NODE(l, r))) = NODE(maptree(f, l), maptree(f, r));
(* If we get a leaf containing, change the value to f(n).
If we get a node, recursively map each branch off the node. *)

maptree(inc, NODE(NODE(LEAF(1), LEAF(2)), LEAF(3)));
maptree(square, (NODE(LEAF(1), LEAF(5))));
maptree(inc, (NODE(LEAF(0), LEAF(3))));
maptree(square, LEAF(3));
maptree(square, NODE(NODE(LEAF(2), LEAF(5)), LEAF(9)));

(* 5.4b *)
(* The type looks like this:
val maptree = fn : ('a -> 'b) * 'a tree -> 'b tree
This is not the expected output because after mapping we could have a tree
containing a very different type, depending on the function we used to map.
For instance, we could have a tree filled with ints and get one with strings. *)

(* 5.5 *)
fun reduce(f, LEAF(n)) = n
  | reduce(f, NODE(l,r)) = f(reduce(f, l),reduce(f, r));

(* The reduce function simply returns the value of the leaf it is called on a leaf, or the combination of the two subtrees if it is called on a node.*)

reduce(add, (NODE(NODE(LEAF(1), LEAF(2)), LEAF (3))));
reduce(add, (NODE(LEAF(1), LEAF(5))));
reduce(add, (NODE(LEAF(0), LEAF(3))));
reduce(add, LEAF(3));
reduce(add, NODE(NODE(LEAF(2), LEAF(5)), LEAF(9)));

(* 3.3.1b *)

fun cycle(nil) = nil 
  | cycle(x::xs) = xs@[x];

cycle([1,2,3,4,5]);
cycle(["f","o","o"]);
cycle([1,0,0,0,0]);
cycle(nil);
cycle(["d","a","n","a"]);

(* 3.3.1c *)

fun cycleN(L,0) = L
  | cycleN(L,N) = cycleN(cycle(L),N-1);

cycleN([1,2,3,4,5],3);
cycleN(["f","o","o"],2);
cycleN([1,0,0,0,0],4);
cycleN(nil,5);
cycleN(["d","a","n","a"],4);

(* 3.3.2 *)

fun flip(nil) = nil
  | flip(x::y::xs) = y::x::flip(xs)
  | flip(x::xs) = x::flip(xs);

flip([1,2,3,4,5,6]);
flip(["d","a","n","a"]);
flip([1,2,3,4,5]);
flip(["g","o","a","t","s"]);
flip(nil);


(* 3.3.3 *)

fun deleteAt(nil,n) = nil
  | deleteAt(x::xs,1) = xs
  | deleteAt(x::xs,n) = x::deleteAt(xs,n-1);

deleteAt([1,2,3,4,5,6],3);
deleteAt(["d","a","n","a"],4);
deleteAt([1,2,3,4,5],6);
deleteAt(["g","o","a","t","s"],2);
deleteAt(nil,10);
