/-  *post
/-  *graph-store
/+  default-agent
/+  dbug
/+  tendiebot-quote
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 api-keys=[stock=tape crypto=tape]]
+$  state-update-poke  [key=?(%stock %crypto) value=tape]
+$  card  card:agent:gall
+$  sign  sign:agent:gall
++  crypto-card
  |=  [=bowl:gall ticker=tape api-key=tape =resource]
  [%pass /post-quote/crypto %arvo %k %fard %tendiebot %crypto-price %noun !>([bowl ticker api-key resource])]
++  stock-card
  |=  [=bowl:gall ticker=tape api-key=tape =resource]
  [%pass /post-quote/stock %arvo %k %fard %tendiebot %stock-price %noun !>([bowl ticker api-key resource])]
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
        %kick
      :_  this
      :~  [%pass /graph/updates %agent [our:bowl %graph-store] %watch /updates]
      ==
        %fact
      ?+  p.cage.sign  (on-agent:def wire sign)
          %graph-update-3
        =/  =update  !<(update q:cage:sign)
        =/  =action  q.update
        ?+  -.action  (on-agent:def wire sign)
            %add-nodes
          =/  =resource  resource.action
          =/  nodes=(list node)  ~(val by nodes.action)
          =/  maybe-posts=(list maybe-post)
            (turn nodes |=(=node post.node))
          =/  tickers=(list (unit tape))
          %-  zing
          %+  murn  maybe-posts
          |=  =maybe-post
          ?+  maybe-post  ~
              [%.y *]
            =/  =post  p.maybe-post
            :-  ~
            %+  murn  contents.post
              |=  =content
              ?+  content  ~
                [%text cord]  `(ticker:tendiebot-quote (trip text.content))
              ==
          ==
          ?~  tickers  `this
          =/  first-ticker=tape  (fall i.tickers ~)
          ?~  first-ticker  `this
          :_  this
          :~
            (crypto-card bowl first-ticker crypto:api-keys resource)
            (stock-card bowl first-ticker stock:api-keys resource)
          ==
        ==
      ==
    ==
  ==
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  wire  (on-arvo:def wire sign-arvo)
    [%post-quote *]  `this
  ==
++  on-fail   on-fail:def
--
