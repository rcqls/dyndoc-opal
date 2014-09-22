var Opal=require("../dist/npm/dyndoc.js")()
var Dyndoc=Opal.Dyndoc

mngr = Dyndoc.Opal.TemplateManager.$new(Opal.hash(),false)
console.log(mngr)

mngr.$init_doc(Opal.hash())

a=mngr.$parse("{#document][#main][#>]titééi[#}")

console.log(a)