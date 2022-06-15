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
  :~  :-  %'refRates'
      %-  ar
      %-  ou
      :~  [%type (uf "" sa)]
          [%'percentRate' (uf .~0 ne)]
      ==
  ==
++  url
  "https://markets.newyorkfed.org/api/rates/all/latest.json"
++  ted
  ^-  thread:spider
  |=  arg=vase
  =/  m  (strand ,vase)
  =/  arguments  !<  [bowl:gall tape resource]  arg
  ^-  form:m
  =/  [=bowl:gall ticker=tape =resource]  arguments
  ;<  =json  bind:m  (fetch-json url)
  ~&  json
  =/  result  (mine-json json)
  =/  text  (bond-format:tendiebot-quote ticker result)
  ;<  ~  bind:m  %+  poke
      [our.bowl %graph-push-hook]
    [%graph-update-3 (reply:tendiebot-quote bowl text resource)]
  (pure:m !>(text))
--
