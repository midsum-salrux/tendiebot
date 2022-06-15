/-  *post, *graph-store
/+  *graph-store
|%
+$  quote  [name=tape price=@rd day-change-percent=(unit @rd)]
+$  sale  [when=tape price=@rd]
+$  bond-rate  [type=tape rate=@rd]
++  rd-to-tape
  |=  [n=@rd]
  ^-  tape
  (r-co:co (rlyd n))
++  ud-to-tape
  |=  [n=@ud]
  ^-  tape
  ((d-co:co 0) n)
++  format
  |=  [name=tape price=@rd day-change-percent=(unit @rd)]
  ^-  tape
  =/  change  (fall day-change-percent .~0)
  ;:  weld
    name
    " $"
    (rd-to-tape price)
    ?:  (sig:rd change)  " +"  " "
    (rd-to-tape change)
    "%"
  ==
++  star-format
  |=  [sales=(list sale)]
  =/  real-sales  (skip sales |=([s=sale] =(price.s .~0)))
  =/  =sale  (rear real-sales)
  ;:  weld
    "Most recent star sale via urbit.live $"  (rd-to-tape price.sale)
    " on "  when.sale
  ==
++  bond-format
  |=  [ticker=tape bonds=(list bond-rate)]
  =/  match  (skim bonds |=(=bond-rate =(ticker type.bond-rate)))
  ?~  match  !!
  =/  bond  i.match
  =/  label
    ?:  =(ticker "SOFR")  "Secured Overnight Financing Rate"
    ?:  =(ticker "EFFR")  "Effective Federal Funds Rate"
    ticker
  ;:  weld
    label  ": "  (rd-to-tape rate.bond)  "%"
  ==
++  ticker
  ::  recognize "asdf $FOOBAR asdf" and return FOOBAR
  |=  text=tape
  ^-  (unit tape)
  =/  cash  (find "$" text)
  ?~  cash  ~
  =/  starting-with-cash  (slag (need cash) text)
  =/  ticker-rule
  ;~  pfix
    (just '$')
    (star ;~(pose (shim 'A' 'Z') (just '/') (just '.') (just '*')))
  ==
  (rust starting-with-cash ;~(sfix ticker-rule (star next)))
  ++  reply
    |=  [=bowl:gall text=tape =resource]
    =/  contents=(list content)  ~[[%text (crip text)]]
    =/  =post
    (~(post create our.bowl now.bowl) ~[now.bowl] contents)
    =/  mp  (maybe-post [%.y post])
    !>  :-  now.bowl
        :+  %add-nodes  resource
        (~(put by *(map index node)) ~[now.bowl] [post=mp children=*internal-graph])
--
