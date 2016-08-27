NB. f/. f\  f\. models --------------------------------------------------
en     =: #@]

randuni''

em     =: (en >.@% 1&>.@|@[)`(en 0&>.@>:@- [) @. (0&<:@[)
kay    =: en`em @. (0&<@[)
omask  =: (em,en) $ ($&0@|@[ , $&1@kay)

base   =: 1&>.@-@[ * i.@em
iind   =: base ,. |@[ <. en - base
seg    =: ((+i.)/@[ { ])"1 _

infix  =: 1 : '(iind  x@seg ])"0 _'
outfix =: 1 : '(omask x@#   ])"0 _'
prefix =: 1 : '>:@,.@i.@# x@{. ]'
suffix =: 1 : ',.@i.@#    x@}. ]'

key    =: 1 : '=@[ x@# ]'

osub   =: >@]`(>@[ >@:{ ]) @. (*@#@])
oind   =: (+/&i./ </.&, i.)@(2&{.)@(,&1 1)@$
ob     =: 1 : 'oind x@osub"0 1 ,@(<"_2)'

bs     =: 1 : '(x prefix) : (x infix )'
bsd    =: 1 : '(x suffix) : (x outfix)'
sd     =: 1 : '(x ob    ) : (x key   )'


NB. f\.y ----------------------------------------------------------------

NB. Boolean
a=:1=?10 5$2
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a
(+./\. -: +./ bsd) a

NB. literal
a=:a.{~32+?10 5$95
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a

NB. literal2
a=:adot1{~32+?10 5$95
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a

NB. literal4
a=:adot2{~32+?10 5$95
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a

NB. integer
a=:?10 5$100
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a
(+/\. -: +/ bsd) a

NB. floating point
a=:o._40+?10 5$100
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a
(+/\. -: +/ bsd) a

NB. complex
a=:^0j0.01*_400+?10 5$1000
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a
(+/\. -: +/ bsd) a

NB. boxed
t=:(1=?70$3)<;.1 ?70$100
a=:t{~?10 3$#t
(<\. -: < bsd) a
(<\. -: < bsd) ,a
(]\. -: ] bsd) a

'' -: <\. ''
'' -: <\. i.0 10 20


NB. f/\.y ----------------------------------------------------------------

(= /\. -: = / bsd) ?20$2
(< /\. -: < / bsd) ?20$2
(<./\. -: <./ bsd) ?20$2
(<:/\. -: <:/ bsd) ?20$2
(> /\. -: > / bsd) ?20$2
(>./\. -: >./ bsd) ?20$2
(>:/\. -: >:/ bsd) ?20$2
(+ /\. -: + / bsd) ?20$2
(+./\. -: +./ bsd) ?20$2
(+:/\. -: +:/ bsd) ?20$2
(* /\. -: * / bsd) ?20$2
(*./\. -: *./ bsd) ?20$2
(*:/\. -: *:/ bsd) ?20$2
(- /\. -: - / bsd) ?20$2
(% /\. -: % / bsd) ?20$2
(^ /\. -: ^ / bsd) ?20$2
(~:/\. -: ~:/ bsd) ?20$2
(| /\. -: | / bsd) ?20$2
(! /\. -: ! / bsd) ?20$2

*./(= /\. -: = / bsd)"1 #:i.32
*./(< /\. -: < / bsd)"1 #:i.32
*./(<./\. -: <./ bsd)"1 #:i.32
*./(<:/\. -: <:/ bsd)"1 #:i.32
*./(> /\. -: > / bsd)"1 #:i.32
*./(>./\. -: >./ bsd)"1 #:i.32
*./(>:/\. -: >:/ bsd)"1 #:i.32
*./(+ /\. -: + / bsd)"1 #:i.32
*./(+./\. -: +./ bsd)"1 #:i.32
*./(+:/\. -: +:/ bsd)"1 #:i.32
*./(* /\. -: * / bsd)"1 #:i.32
*./(*./\. -: *./ bsd)"1 #:i.32
*./(*:/\. -: *:/ bsd)"1 #:i.32
*./(- /\. -: - / bsd)"1 #:i.32
*./(% /\. -: % / bsd)"1 #:i.32
*./(^ /\. -: ^ / bsd)"1 #:i.32
*./(~:/\. -: ~:/ bsd)"1 #:i.32
*./(| /\. -: | / bsd)"1 #:i.32
*./(! /\. -: ! / bsd)"1 #:i.32

*./(= /\. -: = / bsd) |:#:i.32
*./(< /\. -: < / bsd) |:#:i.32
*./(<./\. -: <./ bsd) |:#:i.32
*./(<:/\. -: <:/ bsd) |:#:i.32
*./(> /\. -: > / bsd) |:#:i.32
*./(>./\. -: >./ bsd) |:#:i.32
*./(>:/\. -: >:/ bsd) |:#:i.32
*./(+ /\. -: + / bsd) |:#:i.32
*./(+./\. -: +./ bsd) |:#:i.32
*./(+:/\. -: +:/ bsd) |:#:i.32
*./(* /\. -: * / bsd) |:#:i.32
*./(*./\. -: *./ bsd) |:#:i.32
*./(*:/\. -: *:/ bsd) |:#:i.32
*./(- /\. -: - / bsd) |:#:i.32
*./(% /\. -: % / bsd) |:#:i.32
*./(^ /\. -: ^ / bsd) |:#:i.32
*./(~:/\. -: ~:/ bsd) |:#:i.32
*./(| /\. -: | / bsd) |:#:i.32
*./(! /\. -: ! / bsd) |:#:i.32

(<./\. -: <./bsd) 5e5-~20$1e6
(>./\. -: >./bsd) 5e5-~?20$1e6
(+ /\. -: + /bsd) 5e5-~?20$1e6
(* /\. -: * /bsd) 50-~?7$100
(- /\. -: - /bsd) 5e5-~?20$1e6
(% /\. -: % /bsd) 5e5-~?20$1e6

(<./\. -: <./bsd) 5e5-~?10 17$1e6
(>./\. -: >./bsd) 5e5-~?10 17$1e6
(+ /\. -: + /bsd) 5e5-~?10 17$1e6
(* /\. -: * /bsd) 50-~?10 17$100
(- /\. -: - /bsd) 5e5-~?10 17$1e6
(% /\. -: % /bsd) 5e5-~?10 17$1e6

(<./\. -: <./bsd) o.500-~?20$1e3
(>./\. -: >./bsd) o.500-~?20$1e3
(+ /\. -: + /bsd) o.500-~?20$1e3
(* /\. -: * /bsd) o.50-~?7$100
(- /\. -: - /bsd) o.500-~?20$1e3
(% /\. -: % /bsd) o.500-~?20$1e3

(<./\. -: <./bsd) o.455-~?10 17$1e3
(>./\. -: >./bsd) o.455-~?10 17$1e3
(+ /\. -: + /bsd) o.455-~?10 17$1e3
(* /\. -: * /bsd) o.50-~?10 17$100
(- /\. -: - /bsd) o.455-~?10 17$1e3
(% /\. -: % /bsd) o.455-~?10 17$1e3

(+ /\. -: + /bsd) j./?2 20$1e6
(* /\. -: * /bsd) j./?2 20$100
(- /\. -: - /bsd) j./?2 20$1e6
(% /\. -: % /bsd) j./?2 20$1e6

(+ /\. -: + /bsd) r.?10 17$1e6
(* /\. -: * /bsd) r.?10 17$100
(- /\. -: - /bsd) r.?10 17$1e6
(% /\. -: % /bsd) r.?10 17$1e6

(i.-1+n) -: 0,~+/\.n#1  [ n=:?1000
(n#1)    -: +/\.(-n){.1 [ n=:?1000

(-/\.x)  -: (#x)$2|0 1+#x=:2000$1
(-/\.x)  -: (#x)$2|0 1+#x=:2001$1
(-/\.x)  -: +/\.&.(*&((#x)$_1^1 0+#x)) x=:_900+?100 7$2000
(-/\.x)  -: +/\.&.(*&((#x)$_1^1 0+#x)) x=:_900+?101 7$2000

(%/\.x)  -: */\.&.(^&((#x)$_1^1 0+#x)) x=:>:?100 7$200
(%/\.x)  -: */\.&.(^&((#x)$_1^1 0+#x)) x=:>:?101 7$200


NB. f\."r y -------------------------------------------------------------

(<bsd"0 -: <\."0) x=:?3 5 7$1000
(<bsd"1 -: <\."1) x
(<bsd"2 -: <\."2) x
(<bsd"3 -: <\."3) x

([bsd"0 -: [\."0) x=:a.{~?2 3 5$#a.
([bsd"1 -: [\."1) x
([bsd"2 -: [\."2) x
([bsd"3 -: [\."3) x

f=: [^:(0&~:@[)
(f/\.   -: f/suffix  ) x=: (?   15$2) * ?   15$10
(f/\."1 -: f/suffix"1) x=: (?22 15$2) * ?22 15$10


NB. f/\."r y ------------------------------------------------------------

plus =: 4 : 'x+y'
sum  =: 3 : '+ /y'
#~. (sum\."0 ; plus/\."0 ; +/\."0) x=:?7 5 11$1e6
#~. (sum\."1 ; plus/\."1 ; +/\."1) x
#~. (sum\."2 ; plus/\."2 ; +/\."2) x
#~. (sum\."3 ; plus/\."3 ; +/\."3) x
#~. (sum\."0 ; plus/\."0 ; +/\."0) x=:?7 5 11$6e8
#~. (sum\."1 ; plus/\."1 ; +/\."1) x
#~. (sum\."2 ; plus/\."2 ; +/\."2) x
#~. (sum\."3 ; plus/\."3 ; +/\."3) x

times   =: 4 : 'x*y'
product =: 3 : '* /y'
#~. (product\."0 ; times/\."0 ; */\."0) x=:x+0=x=:50-?7 5 11$100
#~. (product\."1 ; times/\."1 ; */\."1) x
#~. (product\."2 ; times/\."2 ; */\."2) x
#~. (product\."3 ; times/\."3 ; */\."3) x
#~. (product\."0 ; times/\."0 ; */\."0) x=:x+0=x=:5e3-?7 5 11$1e4
#~. (product\."1 ; times/\."1 ; */\."1) x
#~. (product\."2 ; times/\."2 ; */\."2) x
1 = #~. (product\."3 ; times/\."3 ; */\."3) x

max     =: 4 : 'x>.y'
maxover =: 3 : '>./y'
#~. (maxover\."0 ; max/\."0 ; >./\."0) x=:5e5-?7 5 11$1e6
#~. (maxover\."1 ; max/\."1 ; >./\."1) x
#~. (maxover\."2 ; max/\."2 ; >./\."2) x
#~. (maxover\."3 ; max/\."3 ; >./\."3) x
#~. (maxover\."0 ; max/\."0 ; >./\."0) x=:o.5e5-?7 5 11$1e6
#~. (maxover\."1 ; max/\."1 ; >./\."1) x
#~. (maxover\."2 ; max/\."2 ; >./\."2) x
#~. (maxover\."3 ; max/\."3 ; >./\."3) x
#~. (maxover\."0 ; max/\."0 ; >./\."0) x=:?7 5 11$2
#~. (maxover\."1 ; max/\."1 ; >./\."1) x
#~. (maxover\."2 ; max/\."2 ; >./\."2) x
#~. (maxover\."3 ; max/\."3 ; >./\."3) x

xor   =: 4 : 'x~:y'
xover =: 3 : '~:/y'
#~. (xover\."0 ; xor/\."0 ; ~:/\."0) x=:?7 5 11$2
#~. (xover\."1 ; xor/\."1 ; ~:/\."1) x
#~. (xover\."2 ; xor/\."2 ; ~:/\."2) x
#~. (xover\."3 ; xor/\."3 ; ~:/\."3) x

(-: +/\."1) i. 0 (0)}?1$10
(-: +/\."1) i. 0 (0)}?2$10
(-: +/\."1) i. 0 (0)}?3$10
(-: +/\."1) i. 0 (0)}?4$10
(-: +/\."1) i. 0 (0)}?5$10

(-: +/\."2) i. 0 (1)}?2$10
(-: +/\."2) i. 0 (1)}?3$10
(-: +/\."2) i. 0 (1)}?4$10
(-: +/\."2) i. 0 (1)}?5$10

(-: +/\."2) i. 0 (2)}?3$10
(-: +/\."2) i. 0 (2)}?4$10
(-: +/\."2) i. 0 (2)}?5$10


4!:55 ;:'a adot1 adot2 base bs bsd em en f iind infix '
4!:55 ;:'kay key max maxover n ob oind omask osub outfix '
4!:55 ;:'plus prefix product sd seg suffix sum t times x xor xover '


