/-  *post
/-  graph-store
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
+$  sign  sign:agent:gall
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
  :_  this(api-keys [stock="" crypto=""])
  :~  [%pass /graph/updates %agent [our:bowl %graph-store] %watch /updates]
  ==
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
++  on-agent
  |=  [=wire =sign]
  ^-  (quip card _this)
  ?+  wire  (on-agent:def wire sign)
      [%graph %updates ~]
    ?+  -.sign  (on-agent:def wire sign)
        %fact
      ?+  p.cage.sign  (on-agent:def wire sign)
          %graph-update-3
        =/  update  !<(update:graph-store q:cage:sign)
        ~&  update
        `this
      ==
    ==
  ==
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
