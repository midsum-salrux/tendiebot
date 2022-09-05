/-  spider
/-  *resource
/+  *strandio
/+  tendiebot-quote
=,  strand=strand:spider
=,  dejs:format
=,  strand-fail=strand-fail:libstrand:spider
|^  ted
++  mine-json
  %-  ot
  :~  :-  %stats
      %-  ot
      :~  [%'floor_price' ne]
      ==
  ==
++  url  "https://api.opensea.io/api/v1/collection/urbit-id-star/stats?format=json"
++  ted
  ^-  thread:spider
  |=  arg=vase
  =/  m  (strand ,vase)
  =/  arguments  !<  [bowl:gall resource]  arg
  ^-  form:m
  =/  [=bowl:gall =resource]  arguments
  ;<  =json  bind:m  (fetch-json url)
  =/  result  (mine-json json)
  =/  text  (star-format:tendiebot-quote result)
  ;<  ~  bind:m  %+  poke
      [our.bowl %graph-push-hook]
    [%graph-update-3 (reply:tendiebot-quote bowl text resource)]
  (pure:m !>(text))
--
