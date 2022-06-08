|%
+$  quote  [name=tape price=@rd day-change-percent=@rd]
++  rd-to-tape
  |=  [n=@rd]
  ^-  tape
  (r-co:co (rlyd n))
++  format
  |=  [name=tape price=@rd day-change-percent=@rd]
  ^-  tape
  ;:  weld
    name
    " "
    (rd-to-tape price)
    ?:  (sig:rd day-change-percent)  " +"  " "
    (rd-to-tape day-change-percent)
    "%"
  ==
++  ticker
  ::  recognize $FOOBAR and return FOOBAR
  |=  text=tape
  ^-  (unit tape)
  %+  rust  text
  ;~  (comp |=([a=* b=tape] b))
    (just '$')
    (star ;~(pose (shim 'A' 'Z') (just '/') (just '.')))
  ==
--
