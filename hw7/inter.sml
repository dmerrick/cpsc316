datatype Exp = 
  Num of int
| True | False
| Add of Exp * Exp
| Mult of Exp * Exp
| If of Exp * Exp * Exp

datatype Val = 
  Int of int
| Bool of bool

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

