var Opal=require("../dist/npm/dyndoc.js")()
var Dyndoc=Opal.Dyndoc


var s = "{#document][#main]titi[#}"
var r=/\{\#/,r2=/(\]?)\s*(\[[\#\@]([\w\:\|-]*[<>]?[=?!><]?)\})/

var sscan = Opal.DyndocStringScanner.$new(s)

console.log(sscan)


console.log(sscan["$exist?"](r))

console.log(sscan["$exist?"](/to/))


console.log("scan")

console.log(sscan.$scan(r))

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])

sscan.$reset()

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])

sscan["$pos="](18)
console.log("scan_until")

console.log(sscan.$scan_until(r2))

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])
console.log(["match",sscan.match])

sscan.$reset()

console.log("check")

console.log(sscan.$check(r))

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])

sscan.$reset()

console.log("check_until")

console.log(sscan.$check_until(r2))

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])

sscan.$reset()

console.log("skip")

console.log(sscan.$skip(r))

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])

sscan.$reset()


console.log("skip_until")

console.log(sscan.$skip_until(r2))

console.log([sscan.$string(),sscan.$pos(),sscan.$rest(),sscan.$pre_match(),sscan.$matched(),sscan.$post_match()])
