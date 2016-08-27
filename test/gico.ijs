NB. i:y -----------------------------------------------------------------

randuni''

(i: 5) -: _5+i.11
(i:_5) -:  5-i.11
(i: 0) -: ,0

(|.@i: -: i:@(_1 1&*&.+.))"0 (_40+?3 4$100) j. ?3 4$100

ico=: 3 : '(y*-*y)+i.(_1^0>y)++:y' " 0

(i:  5) -: ico  5
(i: _5) -: ico _5
(i:  0) -: ico  0

(#@i: -: >:@+:@| )"0 x=:  _50+20?@$ 100
(#@i: -: >:@+:@| )"0 x=: _500+20?@$1000

(#@i: -: >:@{:@+.)"0 x=: (_50+20 ?@$ 100) j. 1+ 20 ?@$100 
1 = #@~.@(2&(-/\))@i:"0 x

4   = type i:  10j2
8   = type i:  10j3
4   = type i:  10j4
4   = type i:  10j5
8   = type i:  10j6
4   = type i:  10j10
4   = type i:  10j20
4   = type i: _10j5
64  = type i: 10x
64  = type i: 2*5r2
128 = type i:  5r2
128 = type i: _5r2

(i:5r2) -: i: 2.5

f=: 3 : 0 " 0
 n=: (?@# { ])@q: yy=: y
 assert. 4=type i: yy j. n
 1
)

f 2+10?@$100
f 2+10?@$1000

'domain error' -: i: etx 'a'
'domain error' -: i: etx  2.3
'domain error' -: i: etx _2.3
'domain error' -: i: etx <3


NB. x i:y ---------------------------------------------------------------

NB. Boolean
a=:1=?10 5$2
a-:(i:~a){a
(i:~a)-:i:~<"_1 a
a-:(a i:0+a){a
a-:(a i:[&.o.a){a
a-:(a i:[&.(0j1&*)a){a
(<:#a) =a i:{:a
(#a)=a i:4 5 6 7 8
(#a)=a i:'abcde'
(b{_1 0+#a) -: (a=:(>:?200)$0) i: b=:?30$2

NB. literal
a=:a.{~32+?10 5$95
a-:(i:~a){a
(i:~a)-:i:~<"_1 a
0=a i:0{a
(#a)=a i:4 5 6 7 8
(b{({:(a='a')#i.#a),#a) -: (a=:(>:?40)$'axy') i: (b=:?30$2){'ab'
(1|.a) -: (a i:1|.a){a=:a.{~?117 1$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 2$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 3$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 4$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 5$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 6$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 7$#a.
(1|.a) -: (a i:1|.a){a=:a.{~?117 8$#a.

(1|.a) -: (a i: 1|.a){a=:a.{~?23000 2$#a.
(1|.a) -: (a i: 1|.a){a=:a.{~?12000 4$#a.
(1|."2 a) -: (a i:"(2) 1|."2 a){"_1 a=:a.{~?7 23000 2$#a.
(1|."2 a) -: (a i:"(2) 1|."2 a){"_1 a=:a.{~?7 12000 4$#a.

NB. literal2
a=:adot1{~32+?10 5$95
a-:(i:~a){a
(i:~a)-:i:~<"_1 a
0=a i:0{a
(#a)=a i:4 5 6 7 8
(b{({:(a=u:'a')#i.#a),#a) -: (a=:(>:?40)$u:'axy') i: (b=:?30$2){u:'ab'
(1|.a) -: (a i:1|.a){a=:adot1{~?117 1$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 2$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 3$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 4$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 5$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 6$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 7$#adot1
(1|.a) -: (a i:1|.a){a=:adot1{~?117 8$#adot1

(1|.a) -: (a i: 1|.a){a=:adot1{~?23000 2$#adot1
(1|.a) -: (a i: 1|.a){a=:adot1{~?12000 4$#adot1
(1|."2 a) -: (a i:"(2) 1|."2 a){"_1 a=:adot1{~?7 23000 2$#adot1
(1|."2 a) -: (a i:"(2) 1|."2 a){"_1 a=:adot1{~?7 12000 4$#adot1

NB. literal4
a=:adot2{~32+?10 5$95
a-:(i:~a){a
(i:~a)-:i:~<"_1 a
0=a i:0{a
(#a)=a i:4 5 6 7 8
(b{({:(a=10&u:'a')#i.#a),#a) -: (a=:(>:?40)$10&u:'axy') i: (b=:?30$2){10&u:'ab'
(1|.a) -: (a i:1|.a){a=:adot2{~?117 1$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 2$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 3$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 4$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 5$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 6$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 7$#adot2
(1|.a) -: (a i:1|.a){a=:adot2{~?117 8$#adot2

(1|.a) -: (a i: 1|.a){a=:adot2{~?23000 2$#adot2
(1|.a) -: (a i: 1|.a){a=:adot2{~?12000 4$#adot2
(1|."2 a) -: (a i:"(2) 1|."2 a){"_1 a=:adot2{~?7 23000 2$#adot2
(1|."2 a) -: (a i:"(2) 1|."2 a){"_1 a=:adot2{~?7 12000 4$#adot2

NB. integer
a=:?10 5$100
a-:(i:~a){a
(i:~a)-:i:~<"_1 a
a-:(a i:[&.o.a){a
a-:(a i:[&.(0j1&*)a){a
0=a i:0{a
(#a)=a i:4 5 6 7 8
(#a)=a i:'abcde'
(b{({:(a=49)#i.#a),#a) -: (a=:(>:?40)$49 9 123) i: (b=:?40$2){49 _49
(i.31) -: i:~2x^i. 31
(i.31) -: i:~2x^i._31
(30$29) -: i:~30$123456
(30$29) -: i:~30$_12345678
a -: (i:~a){a=:?4000$4000                   NB. small integers
(1000{.a) -: (a i:1000{.a){a=:?4000$4000    NB. small integers
a -: (i:~a){a=: _5 2147483647               NB. large integers
a -: (i:~a){a=:  2 2147483647               NB. large integers
a -: (i:~a){a=: ?4000$123456                NB. large integers
(1000{.a) -: (a i:1000{.a){a=:?4000$123456  NB. large integers

NB. floating point
a=:o._40+?10 5$100
a-:(i:   ~a){a
a-:(i:!.0~a){a
a-:(a i:    [&.(0j1&*)a){a
a-:(a i:!.0 [&.(0j1&*)a){a
(i:   ~a)-:i:   ~<"_1 a
(i:!.0~a)-:i:!.0~<"_1 a
0=a i:    0{a
0=a i:!.0[0{a
(#a)=a i:     4 5 6 7 8
(#a)=a i:!.0 [4 5 6 7 8
(#a)=a i:    'abcde'
(#a)=a i:!.0 'abcde'
(b{({:(a=4.95)#i.#a),#a) -: (a=:(>:?40)$4.95 9 _1.62) i:    (b=:?70$2){4.95 1234
(b{({:(a=4.95)#i.#a),#a) -: (a=:(>:?40)$4.95 9 _1.62) i:!.0 (b=:?70$2){4.95 1234

NB. complex
a=:r.?10 5$1000
a-:(i:    ~a){a
a-:(i:!.0 ~a){a
(i:   ~a)-:i:   ~<"_1 a
(i:!.0~a)-:i:!.0~<"_1 a
0=a i:    0{a
0=a i:!.0[0{a
(#a)=a i:    4 5 6 7 8
(#a)=a i:!.0[4 5 6 7 8
(#a)=a i:    'abcde'
(#a)=a i:!.0 'abcde'
(b{({:(a=4j95)#i.#a),#a) -: (a=:(>:?40)$4j95 9 _1.62) i:    (b=:?30$2){4j95 1234
(b{({:(a=4j95)#i.#a),#a) -: (a=:(>:?40)$4j95 9 _1.62) i:!.0 (b=:?30$2){4j95 1234

NB. boxed
t=:(1=?70$3)<;.1 ?70$100
a=:t{~?10 5$#t
a-:(i:   ~a){a
a-:(i:!.0~a){a
(i:   ~a)-:i:   ~<"_1 a
(i:!.0~a)-:i:!.0~<"_1 a
0=a i:    0{a
0=a i:!.0[0{a
(#a)=a i:    'Cogit'
(#a)=a i:!.0 'Cogit'
(#a)=a i:    4 5 6 7 8
(#a)=a i:!.0[4 5 6 7 8
(b{({:(a=x)#i.#a),#a) -: (a=:(>:?40)$x,<'lieben') i: (b=:?50$2){(x=:<4;'aj95'),<1234
(b{({:(a=x)#i.#a),#a) -: (a=:(>:?40)$x,<u:'lieben') i: (b=:?50$2){(x=:<4;u:'aj95'),<1234
(b{({:(a=x)#i.#a),#a) -: (a=:(>:?40)$x,<10&u:'lieben') i: (b=:?50$2){(x=:<4;10&u:'aj95'),<1234
((i:   ~x){x) -: x=:;:'i:~(?20$3){3 4;([&.o.3 4);[&.(0j1&*)3 4'
((i:!.0~x){x) -: x=:;:'i:~(?20$3){3 4;([&.o.3 4);[&.(0j1&*)3 4'
(20$<:#x) -: i:   ~x=:(?20$3){'';($0);(0$<'')
(20$<:#x) -: i:!.0~x=:(?20$3){'';($0);(0$<'')
(20$<:#x) -: i:   ~x=:(?20$3){3 4;([&.o.3 4);[&.(0j1&*)3 4
(20$<:#x) -: i:!.0~x=:(?20$3){3 4;([&.o.3 4);[&.(0j1&*)3 4


NB. x i:y encore --------------------------------------------------------

a =: 1=?100 4$2
j =: i:~a
j -: a i:0+a
j -: (0+a)i:a
a -: j{a
(#a)   -: a i:'abcd'
(2$#a) -: a i:2 4$2

0         -: (i.6 2 3x)i: i. 2 3x
6         -: (i.6 2 3x)i:2 3$9

($0)      -: (6 2 3$9)i:0 2 3$5
(5 0 4$0) -: (6 2 3$9)i:5 0 4 2 3$5

5         -: (6 2 0$9)i:2 0$0
(3$5)     -: (6 2 0$9)i:3 2 0$0
(3$5)     -: (6 2 0$0.5)i:3 2 0$'a'
(3$5)     -: (6 2 0$0.5)i:3 2 0$<''
(3$5)     -: (6 2 0$0.5)i:3 2 0$u:'a'
(3$5)     -: (6 2 0$0.5)i:3 2 0$<u:''
(3$5)     -: (6 2 0$0.5)i:3 2 0$10&u:'a'
(3$5)     -: (6 2 0$0.5)i:3 2 0$<10&u:''

(($b)$0)  -: ''        i:b=:'abc'
(($b)$0)  -: ''        i:b=:u:'abc'
(($b)$0)  -: ''        i:b=:10&u:'abc'
(($b)$0)  -: ($0)      i:b=:i. 3 4x
(($b)$0)  -: (0$<'')   i:b=:+&.>i.3 4x
0 0       -: (i.0 3 4x)i:b=:i.2 3 4x

3 3 3 3 3 -: (i.3 4x  ) i: 5 4$'a'
3 3 3 3 3 -: (3 4$<'a') i: 5 4$'a'
3 3 3 3 3 -: (i.3 4x  ) i: 5 4$u:'a'
3 3 3 3 3 -: (i.3 4x  ) i: 5 4$u:'a'
3 3 3 3 3 -: (3 4$<'a') i: 5 4$10&u:'a'
3 3 3 3 3 -: (3 4$<'a') i: 5 4$10&u:'a'

test=: 3 : 0
 n=. ?y
 x=. ?n$10>.<.n%3
 y=. x+2.5-2.5
 ((~.x)-:~.y),((~:x)-:~:y),((x i: x) -: y i: y)
)

test 1000
test 1000
test 1000

*./@test"0 [4 5$1000

2 2 2 -: (i.2 3) i: etx i.3 4
2 2 2 -: (i.2 3) i: etx 3 4$'a'
2 2 2 -: (i.2 3) i: etx 3 4$;:'Cogito, erogeneous'
3 3   -: (2 3 4$'x') i:"2 etx 'kakistocracy' 
2 2 2 -: (i.2 3) i: etx 3 4$u:'a'
2 2 2 -: (i.2 3) i: etx 3 4$;:u:'Cogito, erogeneous'
3 3   -: (2 3 4$'x') i:"2 etx u:'kakistocracy' 
2 2 2 -: (i.2 3) i: etx 3 4$10&u:'a'
2 2 2 -: (i.2 3) i: etx 3 4$;:10&u:'Cogito, erogeneous'
3 3   -: (2 3 4$'x') i:"2 etx 10&u:'kakistocracy' 

2     -: (i.2 3) i: etx 4
3 3   -: (2 3 4 6$'x') i:"3 etx 'lieben'
3 3   -: (2 3 4 6$'x') i:"3 etx u:'lieben'
3 3   -: (2 3 4 6$'x') i:"3 etx 10&u:'lieben'


NB. x i:y for strings x and y -------------------------------------------

map  =: 3 : '(i.#y) (a.i.y)}256$#y'
ciof =: a.&i.@] { map@[

f =: i: -: ciof

((?3000$256){a.) f (?4 80$256){a.
((?3000$256){a.) f (? 300$256){a.

map  =: 3 : '(i.#y) (adot1 i.y)}256$#y'
ciof =: adot1&i.@] { map@[

f =: i: -: ciof

((?3000$256){adot1) f (?4 80$256){adot1
((?3000$256){adot1) f (? 300$256){adot1

map  =: 3 : '(i.#y) (adot2 i.y)}256$#y'
ciof =: adot2&i.@] { map@[

f =: i: -: ciof

((?3000$256){adot2) f (?4 80$256){adot2
((?3000$256){adot2) f (? 300$256){adot2


NB. x i:y on boxed numerics ---------------------------------------------

1 1 -: i:   ~<"0 [ 1,1-2^_45
1 1 -: i:   ~<"0 |.1,1-2^_45
0 1 -: i:!.0~<"0 [ 1,1-2^_45
0 1 -: i:!.0~<"0 |.1,1-2^_45

(i:~t) -: (2*#x)$(#x)+i:~x [ t=:(<"0 x), <"0          x=:?180$90
(i:~t) -: (2*#x)$(#x)+i:~x [ t=:(<"0 x), <"0 (o.1)%~o.x=:?180$90
(i:~t) -: (2*#x)$(#x)+i:~x [ t=:(<"0 x),~<"0 (o.1)%~o.x=:?180$90

(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.0,  x=:?40$2
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.345,x=:?40$2
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3.5,x=:?40$2
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3j5,x=:?40$2
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.0,  x=:?40$2e9
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.345,x=:?40$2e9
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3.5,x=:?40$2e9
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3j5,x=:?40$2e9
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.0,  x=:o.?40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.345,x=:o.?40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3.5,x=:o.?40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3j5,x=:o.?40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.0,  x=:j./?2 40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.345,x=:j./?2 40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3.5,x=:j./?2 40$2e7
(2$<i:~x) -: (y i:<"0 x); (<"0 x)i:y=:<"0 }.3j5,x=:j./?2 40$2e7


NB. x i:"r y ------------------------------------------------------------

g =: 4 : 'x i: y'

(i.3 0) (g"1 -: i:"1) i.3 2
(i.3 0) (g"1 -: i:"1) i.3 0
(i.0 0) (g"1 -: i:"1) i.0 7
(i.0 7) (g"1 -: i:"1) i.0 3
(i.3)   (g"1 -: i:"1) i.0 7
(i.3)   (g"1 -: i:"1) i.0 0
''      (g"1 -: i:"1) i.0 7
''      (g"1 -: i:"1) i.0 5
''      (g"1 -: i:"1) i.0 0
(i.3 5) (g"1 -: i:"1) 3 7$'a'
(i.3 5) (g"1 -: i:"1) 3 7$u:'a'
(i.3 5) (g"1 -: i:"1) 3 7$10&u:'a'
(i.3 5) (g"1 -: i:"1) 3 7$<5
'abc'   (g"1 -: i:"1) 7 5$3
'abc'   (g"1 -: i:"1) 7 5$<3
(u:'abc')   (g"1 -: i:"1) 7 5$3
(u:'abc')   (g"1 -: i:"1) 7 5$<3
(10&u:'abc')   (g"1 -: i:"1) 7 5$3
(10&u:'abc')   (g"1 -: i:"1) 7 5$<3

NB. literal
(i.6)       -: x i:"1 0 (<0 1)|:x=:a.{~6 16$32+96?96
(15-i.6)    -: x i:"1 0 (<0 1)|:|."1 x
(6$0)       -: x i:"1 0 {."1 x
(6$15)      -: x i:"1 0 {:"1 x
(($x)$i.16) -: x i:"1 x
(x=:0=5|?20 19$2) (g"1 -: i:"1) 1

x=:a.{~?(117 7,c)$#a. [ c=:3
x (g"2  -: i:"2 ) y=:a.{~?(14,   c)$#a. 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:a.{~?(117 3,c)$#a.
x (g"_1 -: i:"_1) y=:a.{~?(117,  c)$#a.
x=:a.{~?(117 7,c)$#a. [ c=:4
x (g"2  -: i:"2 ) y=:a.{~?(14,   c)$#a. 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:a.{~?(117 3,c)$#a.
x (g"_1 -: i:"_1) y=:a.{~?(117,  c)$#a.
x=:a.{~?(117 7,c)$#a. [ c=:11
x (g"2  -: i:"2 ) y=:a.{~?(14,   c)$#a. 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:a.{~?(117 3,c)$#a.
x (g"_1 -: i:"_1) y=:a.{~?(117,  c)$#a.

NB. literal2
(i.6)       -: x i:"1 0 (<0 1)|:x=:adot1{~6 16$32+96?96
(15-i.6)    -: x i:"1 0 (<0 1)|:|."1 x
(6$0)       -: x i:"1 0 {."1 x
(6$15)      -: x i:"1 0 {:"1 x
(($x)$i.16) -: x i:"1 x
(x=:0=5|?20 19$2) (g"1 -: i:"1) 1

x=:adot1{~?(117 7,c)$#adot1 [ c=:3
x (g"2  -: i:"2 ) y=:adot1{~?(14,   c)$#adot1 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:adot1{~?(117 3,c)$#adot1
x (g"_1 -: i:"_1) y=:adot1{~?(117,  c)$#adot1
x=:adot1{~?(117 7,c)$#adot1 [ c=:4
x (g"2  -: i:"2 ) y=:adot1{~?(14,   c)$#adot1 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:adot1{~?(117 3,c)$#adot1
x (g"_1 -: i:"_1) y=:adot1{~?(117,  c)$#adot1
x=:adot1{~?(117 7,c)$#adot1 [ c=:11
x (g"2  -: i:"2 ) y=:adot1{~?(14,   c)$#adot1 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:adot1{~?(117 3,c)$#adot1
x (g"_1 -: i:"_1) y=:adot1{~?(117,  c)$#adot1

NB. literal4
(i.6)       -: x i:"1 0 (<0 1)|:x=:adot2{~6 16$32+96?96
(15-i.6)    -: x i:"1 0 (<0 1)|:|."1 x
(6$0)       -: x i:"1 0 {."1 x
(6$15)      -: x i:"1 0 {:"1 x
(($x)$i.16) -: x i:"1 x
(x=:0=5|?20 19$2) (g"1 -: i:"1) 1

x=:adot2{~?(117 7,c)$#adot2 [ c=:3
x (g"2  -: i:"2 ) y=:adot2{~?(14,   c)$#adot2 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:adot2{~?(117 3,c)$#adot2
x (g"_1 -: i:"_1) y=:adot2{~?(117,  c)$#adot2
x=:adot2{~?(117 7,c)$#adot2 [ c=:4
x (g"2  -: i:"2 ) y=:adot2{~?(14,   c)$#adot2 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:adot2{~?(117 3,c)$#adot2
x (g"_1 -: i:"_1) y=:adot2{~?(117,  c)$#adot2
x=:adot2{~?(117 7,c)$#adot2 [ c=:11
x (g"2  -: i:"2 ) y=:adot2{~?(14,   c)$#adot2 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:adot2{~?(117 3,c)$#adot2
x (g"_1 -: i:"_1) y=:adot2{~?(117,  c)$#adot2

x=:p+?117 7$q [ p=:0 [ q=:14
x (g"1  -: i:"1 ) y=:p+?q
x (g"1  -: i:"1 ) x
x (g"1  -: i:"1 ) y=:p+?117 3$q
x (g"1  -: i:"1 ) y=:p+?12$q
x (g"_1 -: i:"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:_7 [ q=:14
x (g"1  -: i:"1 ) y=:p+?q
x (g"1  -: i:"1 ) x
x (g"1  -: i:"1 ) y=:p+?117 3$q
x (g"1  -: i:"1 ) y=:p+?12$q
x (g"_1 -: i:"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:_2000 [ q=:14
x (g"1  -: i:"1 ) y=:p+?q
x (g"1  -: i:"1 ) x
x (g"1  -: i:"1 ) y=:p+?117 3$q
x (g"1  -: i:"1 ) y=:p+?12$q
x (g"_1 -: i:"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:0 [ q=:1e4
x (g"1  -: i:"1 ) y=:p+?q
x (g"1  -: i:"1 ) x
x (g"1  -: i:"1 ) y=:p+?117 3$q
x (g"1  -: i:"1 ) y=:p+?12$q
x (g"_1 -: i:"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:_5e5 [ q=:1e6
x (g"1  -: i:"1 ) y=:p+?q
x (g"1  -: i:"1 ) x
x (g"1  -: i:"1 ) y=:p+?117 3$q
x (g"1  -: i:"1 ) y=:p+?12$q
x (g"_1 -: i:"_1) y=:p+?117$q

x=:?7 63 3$q=:4
x (g"2  -: i:"2 ) y=:((?10$63){0{x),?14 3$q 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:(?~1{$y){"2 y=:x,"2?7 5 3$q
x (g"_1 -: i:"_1) y=:((?5$63){1{x),?2 3$q

x=:o.?7 13 3$q=:3
x (g"2  -: i:"2 ) y=:((?10$13){0{x),o.?14 3$q 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:(?~1{$y){"2 y=:x,"2 o.?7 5 3$q
x (g"_1 -: i:"_1) y=:((?5$13){1{x),o.?2 3$q

x=:r.?7 13 3$q=:3
x (g"2  -: i:"2 ) y=:((?10$13){0{x),r.?14 3$q 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:(?~1{$y){"2 y=:x,"2 r.?7 5 3$q
x (g"_1 -: i:"_1) y=:((?5$13){1{x),r.?2 3$q

x=:<"0 ?7 63 3$q=:3
x (g"2  -: i:"2 ) y=:((?10$63){0{x),<"0?14 3$q 
x (g"2  -: i:"2 ) x
x (g"2  -: i:"2 ) y=:(?~1{$y){"2 y=:x,"2<"0?7 5 3$q
x (g"_1 -: i:"_1) y=:((?5$63){1{x),<"0?2 3$q

x (g"1 2 -: i:"1 2) x=:1 2,:3 4


NB. x i:!.0 "r y --------------------------------------------------------

g =: 4 : 'x i:!.0 y'

(i.3 0) (g"1 -: i:!.0"1) i.3 2
(i.3 0) (g"1 -: i:!.0"1) i.3 0
(i.0 0) (g"1 -: i:!.0"1) i.0 7
(i.0 7) (g"1 -: i:!.0"1) i.0 3
(i.3)   (g"1 -: i:!.0"1) i.0 7
(i.3)   (g"1 -: i:!.0"1) i.0 0
''      (g"1 -: i:!.0"1) i.0 7
''      (g"1 -: i:!.0"1) i.0 5
''      (g"1 -: i:!.0"1) i.0 0
(i.3 5) (g"1 -: i:!.0"1) 3 7$'a'
(i.3 5) (g"1 -: i:!.0"1) 3 7$<5
'abc'   (g"1 -: i:!.0"1) 7 5$3
'abc'   (g"1 -: i:!.0"1) 7 5$<3

NB. literal
(i.6)       -: x i:!.0"1 0 (<0 1)|:x=:a.{~6 16$32+96?96
(15-i.6)    -: x i:!.0"1 0 (<0 1)|:|."1 x
(6$0)       -: x i:!.0"1 0 {."1 x
(6$15)      -: x i:!.0"1 0 {:"1 x
(($x)$i.16) -: x i:!.0"1 x
(x=:0=5|?20 19$2) (g"1 -: i:!.0"1) 1

x=:a.{~?(117 7,c)$#a. [ c=:3
x (g"2  -: i:!.0"2 ) y=:a.{~?(14,   c)$#a. 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:a.{~?(117 3,c)$#a.
x (g"_1 -: i:!.0"_1) y=:a.{~?(117,  c)$#a.
x=:a.{~?(117 7,c)$#a. [ c=:4
x (g"2  -: i:!.0"2 ) y=:a.{~?(14,   c)$#a. 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:a.{~?(117 3,c)$#a.
x (g"_1 -: i:!.0"_1) y=:a.{~?(117,  c)$#a.
x=:a.{~?(117 7,c)$#a. [ c=:11
x (g"2  -: i:!.0"2 ) y=:a.{~?(14,   c)$#a. 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:a.{~?(117 3,c)$#a.
x (g"_1 -: i:!.0"_1) y=:a.{~?(117,  c)$#a.

NB. literal2
(i.6)       -: x i:!.0"1 0 (<0 1)|:x=:adot1{~6 16$32+96?96
(15-i.6)    -: x i:!.0"1 0 (<0 1)|:|."1 x
(6$0)       -: x i:!.0"1 0 {."1 x
(6$15)      -: x i:!.0"1 0 {:"1 x
(($x)$i.16) -: x i:!.0"1 x
(x=:0=5|?20 19$2) (g"1 -: i:!.0"1) 1

x=:adot1{~?(117 7,c)$#adot1 [ c=:3
x (g"2  -: i:!.0"2 ) y=:adot1{~?(14,   c)$#adot1 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:adot1{~?(117 3,c)$#adot1
x (g"_1 -: i:!.0"_1) y=:adot1{~?(117,  c)$#adot1
x=:adot1{~?(117 7,c)$#adot1 [ c=:4
x (g"2  -: i:!.0"2 ) y=:adot1{~?(14,   c)$#adot1 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:adot1{~?(117 3,c)$#adot1
x (g"_1 -: i:!.0"_1) y=:adot1{~?(117,  c)$#adot1
x=:adot1{~?(117 7,c)$#adot1 [ c=:11
x (g"2  -: i:!.0"2 ) y=:adot1{~?(14,   c)$#adot1 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:adot1{~?(117 3,c)$#adot1
x (g"_1 -: i:!.0"_1) y=:adot1{~?(117,  c)$#adot1

NB. literal4
(i.6)       -: x i:!.0"1 0 (<0 1)|:x=:adot2{~6 16$32+96?96
(15-i.6)    -: x i:!.0"1 0 (<0 1)|:|."1 x
(6$0)       -: x i:!.0"1 0 {."1 x
(6$15)      -: x i:!.0"1 0 {:"1 x
(($x)$i.16) -: x i:!.0"1 x
(x=:0=5|?20 19$2) (g"1 -: i:!.0"1) 1

x=:adot2{~?(117 7,c)$#adot2 [ c=:3
x (g"2  -: i:!.0"2 ) y=:adot2{~?(14,   c)$#adot2 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:adot2{~?(117 3,c)$#adot2
x (g"_1 -: i:!.0"_1) y=:adot2{~?(117,  c)$#adot2
x=:adot2{~?(117 7,c)$#adot2 [ c=:4
x (g"2  -: i:!.0"2 ) y=:adot2{~?(14,   c)$#adot2 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:adot2{~?(117 3,c)$#adot2
x (g"_1 -: i:!.0"_1) y=:adot2{~?(117,  c)$#adot2
x=:adot2{~?(117 7,c)$#adot2 [ c=:11
x (g"2  -: i:!.0"2 ) y=:adot2{~?(14,   c)$#adot2 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:adot2{~?(117 3,c)$#adot2
x (g"_1 -: i:!.0"_1) y=:adot2{~?(117,  c)$#adot2

x=:p+?117 7$q [ p=:0 [ q=:14
x (g"1  -: i:!.0"1 ) y=:p+?q
x (g"1  -: i:!.0"1 ) x
x (g"1  -: i:!.0"1 ) y=:p+?117 3$q
x (g"1  -: i:!.0"1 ) y=:p+?12$q
x (g"_1 -: i:!.0"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:_7 [ q=:14
x (g"1  -: i:!.0"1 ) y=:p+?q
x (g"1  -: i:!.0"1 ) x
x (g"1  -: i:!.0"1 ) y=:p+?117 3$q
x (g"1  -: i:!.0"1 ) y=:p+?12$q
x (g"_1 -: i:!.0"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:_2000 [ q=:14
x (g"1  -: i:!.0"1 ) y=:p+?q
x (g"1  -: i:!.0"1 ) x
x (g"1  -: i:!.0"1 ) y=:p+?117 3$q
x (g"1  -: i:!.0"1 ) y=:p+?12$q
x (g"_1 -: i:!.0"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:0 [ q=:1e4
x (g"1  -: i:!.0"1 ) y=:p+?q
x (g"1  -: i:!.0"1 ) x
x (g"1  -: i:!.0"1 ) y=:p+?117 3$q
x (g"1  -: i:!.0"1 ) y=:p+?12$q
x (g"_1 -: i:!.0"_1) y=:p+?117$q
x=:p+?117 7$q [ p=:_5e5 [ q=:1e6
x (g"1  -: i:!.0"1 ) y=:p+?q
x (g"1  -: i:!.0"1 ) x
x (g"1  -: i:!.0"1 ) y=:p+?117 3$q
x (g"1  -: i:!.0"1 ) y=:p+?12$q
x (g"_1 -: i:!.0"_1) y=:p+?117$q

x=:?7 63 3$q=:4
x (g"2  -: i:!.0"2 ) y=:((?10$63){0{x),?14 3$q 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:(?~1{$y){"2 y=:x,"2?7 5 3$q
x (g"_1 -: i:!.0"_1) y=:((?5$63){1{x),?2 3$q

x=:o.?7 13 3$q=:3
x (g"2  -: i:!.0"2 ) y=:((?10$13){0{x),o.?14 3$q 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:(?~1{$y){"2 y=:x,"2 o.?7 5 3$q
x (g"_1 -: i:!.0"_1) y=:((?5$13){1{x),o.?2 3$q

x=:r.?7 13 3$q=:3
x (g"2  -: i:!.0"2 ) y=:((?10$13){0{x),r.?14 3$q 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:(?~1{$y){"2 y=:x,"2 r.?7 5 3$q
x (g"_1 -: i:!.0"_1) y=:((?5$13){1{x),r.?2 3$q

x=:<"0 ?7 63 3$q=:3
x (g"2  -: i:!.0"2 ) y=:((?10$63){0{x),<"0?14 3$q 
x (g"2  -: i:!.0"2 ) x
x (g"2  -: i:!.0"2 ) y=:(?~1{$y){"2 y=:x,"2<"0?7 5 3$q
x (g"_1 -: i:!.0"_1) y=:((?5$63){1{x),<"0?2 3$q

x (g"1 2 -: i:!.0"1 2) x=:1 2,:3 4


NB. x i: y for floats ---------------------------------------------------

f=: 4 : 0
 ct=: x
 y -: (i:!.ct~ y){y
)

(2^-34+-:i.3 10) f"0 1 x=: 0.001 * _1e5 + ?777$2e5

f1=: 3 : 0
 t -: (i:~ t){t=. y+i.1000
)

f1"0] 10^i.2 10

f2=: 3 : 0
 t -: (i:~ t){t=. y+?~1000
)

f2"0] 10^i.2 10


4!:55 ;:'a adot1 adot2 b c ciof ct f f1 f2 g ico j map n p q t test x y yy'


