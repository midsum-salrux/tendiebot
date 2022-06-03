/-  spider
/+  *strandio
/+  *tendiebot-quote
=,  strand=strand:spider
=,  dejs:format
=,  strand-fail=strand-fail:libstrand:spider
|^  ted
++  mine-json
  |=  symbol=tape
  %-  ot
  :~  name+sa
      close+sa
      [%'percent_change' sa]
  ==
++  url
  |=  [symbol=tape api-key=tape]
  ^-  tape
  ;:  weld
    "https://api.twelvedata.com/quote?symbol="
    symbol
    "&apikey="
    api-key
  ==
++  numberize
  |=  [name=tape price=tape change=tape]
  ^-  quote
  :+  name
    (ne (need (de-json:html (crip price))))
  (ne (need (de-json:html (crip change))))
++  ted
  ^-  thread:spider
  |=  arg=vase
  =/  m  (strand ,vase)
  =/  arguments  !<  (unit [tape tape])  arg
  ^-  form:m
  ?~  arguments
    (strand-fail %no-arg ~)
  =/  [symbol=tape api-key=tape]  (need arguments)
  ;<  =json  bind:m  (fetch-json (url symbol api-key))
  =/  result  ((mine-json symbol) json)
  (pure:m !>((numberize result)))
--
