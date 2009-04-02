
datatype Exp = 
  Num of int
| True | False
| Add of Exp * Exp
| Mult of Exp * Exp
| If of Exp * Exp * Exp
| Not of Exp
| Less of Exp * Exp
| More of Exp * Exp

datatype Val = 
  Int of int
| Bool of bool

(* Question 1 *)
fun inter(e) = case e of 
  Num(x) => Int(x)
| True => Bool(true)
| False => Bool(false)
| Add(e1, e2) =>
    let 
      val Int(v1) = inter(e1)
      val Int(v2) = inter(e2)
    in 
      Int(v1 + v2)
    end
| Mult(e1, e2) => 
    let 
      val Int(v1) = inter(e1)
      val Int(v2) = inter(e2)
    in 
      Int(v1 * v2)
    end
| If(e1, e2, e3) => 
    let 
      val Bool(v) = inter(e1)
    in
      if v then inter(e2) else inter(e3)
    end
| Not(e1) => 
    let 
      val Bool(b) = inter(e1)
    in
      if b then Bool(false) else Bool(true)
    end
| Less(e1, e2) => 
    let 
      val Int(v1) = inter(e1)
      val Int(v2) = inter(e2)
    in
      Bool(v1<v2)
    end
| More(e1, e2) => 
    let 
      val Int(v1) = inter(e1)
      val Int(v2) = inter(e2)
    in
      Bool(v1>v2)
    end;

inter(Not(Less(Num(11),Num(16))));
inter(If(More(Num(11), Num(16)), Num(1), Num(2)));
inter(If(Not(False), Num(0), Num(1)));
inter(Less(Num(0), Num(1)));
inter(More(Num(0), Num(1)));

(*
* val it = Bool false : Val
* val it = Int 2 : Val
* val it = Int 0 : Val
* val it = Bool true : Val
* val it = Bool false : Val
*)

(* symbol table commands from hw6 *)
exception Unbound;
fun lookup(s,nil)=raise Unbound
  | lookup(s,(x,n)::nil)=if s=x then n else raise Unbound
  | lookup(s,(x,n)::xs)=if s=x then n else lookup(s,xs);
fun update(s,i,l) = (s,i)::l;

fun interpret(E) = 
  let 
    fun inter(e,ar) = case e of 
      Num(x) => Int(x)
    | True => Bool(true)
    | False => Bool(false)
    | Add(e1, e2) =>
        let 
          val Int(v1) = inter(e1,ar)
          val Int(v2) = inter(e2,ar)
        in 
          Int(v1 + v2)
        end
    | Mult(e1, e2) => 
        let 
          val Int(v1) = inter(e1,ar)
          val Int(v2) = inter(e2,ar)
        in 
          Int(v1 * v2)
        end
    | If(e1, e2, e3) => 
        let 
          val Bool(v) = inter(e1,ar)
        in
          if v then inter(e2,ar) else inter(e3,ar)
        end
    | Not(e1) => 
        let 
          val Bool(b) = inter(e1,ar)
        in
          if b then Bool(false) else Bool(true)
        end
    | Less(e1, e2) => 
        let 
          val Int(v1) = inter(e1,ar)
          val Int(v2) = inter(e2,ar)
        in
          Bool(v1<v2)
        end
    | More(e1, e2) => 
        let 
          val Int(v1) = inter(e1,ar)
          val Int(v2) = inter(e2,ar)
        in
          Bool(v1>v2)
        end
    | Let(s,e1,e2) =>
        let
          val Int(v) = inter(e1,ar)
        in
          update(s,v,ar)
          inter(e2,ar)
        end
    | Var(s) =>
        let
          val (nil,Int(v))=lookup(s,ar)
        in
          v
        end
  in
    inter(E,nil)
  end;

interpret(Let("dana", Num(1), Var("dana")));
interpret(Let("x", Add(Num(1), Num(2)), Mult(Var("x"), Num(3))));
interpret(Let("x", Add(Num(1), Num(2)), Mult(Var("x"), Var("y"))));
