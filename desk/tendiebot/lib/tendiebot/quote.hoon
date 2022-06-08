/-  *post, *graph-store
/+  graph-store
|%
+$  quote  [name=tape price=@rd day-change-percent=(unit @rd)]
++  rd-to-tape
  |=  [n=@rd]
  ^-  tape
  (r-co:co (rlyd n))
++  format
  |=  [name=tape price=@rd day-change-percent=(unit @rd)]
  ^-  tape
  =/  change  (fall day-change-percent .~0)
  ;:  weld
    name
    " "
    (rd-to-tape price)
    ?:  (sig:rd change)  " +"  " "
    (rd-to-tape change)
    "%"
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
    (star ;~(pose (shim 'A' 'Z') (just '/') (just '.')))
  ==
  (rust starting-with-cash ;~(sfix ticker-rule (star next)))
++  reply-card
  |=  [=bowl:gall text=tape =resource]
  =/  contents=(list content)  ~[[%text (crip text)]]
  =/  =post
  (~(post create:graph-store our.bowl now.bowl) *index contents)
  =/  mp  (maybe-post [%.y post])
  mp
  ::  :+  %add-nodes  resource
  ::  (~(put by *(map index node)) ~ post=(`maybe-post`[%.y post]))
--
