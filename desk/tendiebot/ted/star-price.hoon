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
  :~  :-  %sales
      %-  ar
      %-  ot
      :~  [%date sa]
          [%'priceUsd' ne]
      ==
  ==
++  url
  |=  [now=@da]
  ^-  tape
  =/  =date  (yore now)
  =/  year   (ud-to-tape:tendiebot-quote y.date)
  =/  month  (ud-to-tape:tendiebot-quote m.date)
  =/  day    (ud-to-tape:tendiebot-quote d.t.date)
  ;:  weld
    "https://api.urbit.live/stats?topic=1&fromDate=1-1-"  year
    "&toDate="  day  "-"  month  "-"  year
  ==
++  ted
  ^-  thread:spider
  |=  arg=vase
  =/  m  (strand ,vase)
  =/  arguments  !<  [bowl:gall resource]  arg
  ^-  form:m
  =/  [=bowl:gall =resource]  arguments
  ;<  =json  bind:m  (fetch-json (url now.bowl))
  =/  result  (mine-json json)
  =/  text  (star-format:tendiebot-quote result)
  ;<  ~  bind:m  %+  poke
      [our.bowl %graph-push-hook]
    [%graph-update-3 (reply:tendiebot-quote bowl text resource)]
  (pure:m !>(text))
--
