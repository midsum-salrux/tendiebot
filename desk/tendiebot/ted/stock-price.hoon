/-  spider
/-  *resource
/+  *strandio
/+  tendiebot-quote
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
  ^-  quote:tendiebot-quote
  :+  name
    (ne (need (de-json:html (crip price))))
  `(ne (need (de-json:html (crip change))))
++  ted
  ^-  thread:spider
  |=  arg=vase
  =/  m  (strand ,vase)
  =/  arguments  !<  [bowl:gall tape tape resource]  arg
  ^-  form:m
  =/  [=bowl:gall symbol=tape api-key=tape =resource]  arguments
  ;<  =json  bind:m  (fetch-json (url symbol api-key))
  =/  result  (numberize ((mine-json symbol) json))
  =/  text  (format:tendiebot-quote result)
  ~&  ~[(reply-card:tendiebot-quote bowl text resource)]
  (pure:m !>(text))
--
