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
  :~  :-  %data
      %-  ot
      :~  :-  `@tas`(crip symbol)
          %-  ar
          %-  ot
          :~  name+sa
            :-  %quote
            %-  ot
            :~  :-  %'USD'
                %-  ot
                :~  price+ne
                    [%'percent_change_24h' ne]
                ==
            ==
          ==
      ==
  ==
++  url
  |=  [symbol=tape api-key=tape]
  ^-  tape
  ;:  weld
    "https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?symbol="
    symbol
    "&CMC_PRO_API_KEY="
    api-key
  ==
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
  =/  mined-json  `quote`(snag 0 ((mine-json symbol) json))
  (pure:m !>(mined-json))
--
