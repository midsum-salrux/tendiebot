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
                :~  [%price ne]
                    [%'percent_change_24h' (mu ne)]
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
  =/  arguments  !<  [bowl:gall tape tape resource]  arg
  ^-  form:m
  =/  [=bowl:gall symbol=tape api-key=tape =resource]  arguments
  ;<  =json  bind:m  (fetch-json (url symbol api-key))
  =/  result  `quote:tendiebot-quote`(snag 0 ((mine-json symbol) json))
  =/  text  (format:tendiebot-quote result)
  ~&  ~[(reply-card:tendiebot-quote bowl text resource)]
  (pure:m !>(text))
--
