var Opal=require("../dist/npm/dyndoc.js")()
var Dyndoc=Opal.Dyndoc

var txt="{#document][#main][#>]toto[TOTO][#>]<<<\
	titééi #{toto}\
	[#?]#{+?toto}[#>]PLUS\
	[#?]#{=toto} == 'TOTO'[#>]PLUS2\
	[#rb<]@tata='joe'\
[#nl][#>]tata is :{@tata}[#nl]\
{#case]:{@tata},#{toto},joe\
[#when]joe[#>]I am JOE\
[#when]TOTO[#>]I am Toto\
[#case}\
	>>>[#}"



var mngr = Dyndoc.Opal.TemplateManager.$new(Opal.hash(),false)
console.log(mngr)

mngr.$init_doc(Opal.hash())

a=mngr.$parse(txt)

console.log(a)
