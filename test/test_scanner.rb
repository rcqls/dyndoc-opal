require '/Users/remy/Github/dyndoc-opal/test/dyndoc_helpers.rb'

d = Dyndoc::DevTagScanner.new :dtag

aa = d.process "{#document][#main]titééi[#}"
p [:process,aa]

vsc = Dyndoc::VarsScanner.new :vars
p vsc
p (vsc.build_vars("<<[tutu]<<[toto]"))
