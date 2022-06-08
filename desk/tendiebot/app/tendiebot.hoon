/+  default-agent
/+  dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 api-keys=[stock=tape crypto=tape]]
+$  state-update-poke  [key=?(%stock %crypto) value=tape]
:: aliases
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
++  on-init
  ^-  (quip card _this)
  `this(api-keys [stock="" crypto=""])
++  on-save
  ^-  vase
  !>  state
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+  mark  !!
      %noun
    =/  update  !<(state-update-poke vase)
    =/  key=?(%crypto %stock)  key:update
    ?-  key
      %crypto  `this(api-keys [stock=stock:api-keys crypto=value:update])
      %stock   `this(api-keys [stock=value:update crypto=crypto:api-keys])
    ==
  ==
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
