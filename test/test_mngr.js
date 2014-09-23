var Opal=require("../dist/npm/dyndoc.js")()
var Dyndoc=Opal.Dyndoc

var txt="{#document][#main][#>]toto[TOTO][#>]\
	titééi #{toto}\
	[#?]#{+?toto}[#>]PLUS\
	[#?]#{=toto} == 'TOTO'[#>]PLUS2\
	[#}"

var mngr = Dyndoc.Opal.TemplateManager.$new(Opal.hash(),false)
console.log(mngr)

mngr.$init_doc(Opal.hash())

a=mngr.$parse(txt)

console.log(a)