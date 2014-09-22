var d=require("../dist/npm/dyndoc.js")
var Opal=d().Opal
var Dyndoc=d().Dyndoc()

vsc = Dyndoc.VarsScanner.$new("vars")
vsc.$build_vars("<<[tutu]<<[toto]")