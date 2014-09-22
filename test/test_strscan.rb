# need complete path
require '/Users/remy/Github/dyndoc-opal/test/dyndoc_helpers.rb'

#s,r,r2="tototito",/tot/,/ti/
s,r,r2="{#document][#main]titi[#}",/\{\#/,/(\]?)\s*(\[[\#\@]([\w\:\|-]*[<>]?[=?!><]?)\})/
a=DyndocStringScanner.new(s)

p (a.exist? r)

p [a.string,a.pos]

p "scan"

p (a.scan r)

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

a.reset

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

a.pos=18
p "scan_until"

p (a.scan_until r2)

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]
p [:match,a.match] if RUBY_ENGINE=="opal"

a.reset

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

p "check"

p (a.check r)

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

a.reset

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

p "check_until"

p (a.check_until r2)

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

a.reset

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

p "skip"

p (a.skip r)

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

a.reset

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

p "skip_until"

p (a.skip_until r2)

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]

a.reset

p [a.string,a.pos,a.rest,a.pre_match,a.matched,a.post_match]


# txt = ""

# txt += "toto"

# p txt

# p txt.byteslice 0,3

# p txt.byteslice 0...3
