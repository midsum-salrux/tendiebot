/-  hd=herd
|_  =herd:hd
++  grow
  |%
  ++  noun  herd
  ++  mime
    ^-  ^mime
    [/text/x-herd (as-octt:mimes:html (spit-herd herd))]
  ++  spit-herd
    |=  =herd:hd
    ^-  tape
    =/  lines=tape  (zing (turn herd spit-beef))
    ;:  weld
      ":~\0a"
      lines
      "=="
    ==
  ++  spit-beef
    |=  =beef:hd
    ^-  tape
    =/  [who=$@(%our ship) des=desk ver=$@(%trak case)]  beef
    ;:  weld
      "  ["
      ?+  who  (trip (scot %p who))
        %our  "%our"
      ==  " "
      "%"  (trip des)  " "
      (spit-ver ver)
      "]\0a"
    ==
  ++  spit-ver
    |=  ver=$@(%trak case)
    ^-  tape
    ?+  ver
      ;:  weld
        "["
        "%"  (trip -.ver)  " "
        (trip (scot -.ver +.ver))
        "]"
      ==
      %trak  "%trak"
    ==
  --
++  grab
  |%
  ++  noun  herd:hd
  ++  mime
    |=  [=mite len=@ud tex=@]
    ^-  herd:hd
    !<(herd:hd (slap !>(~) (ream tex)))
  --
++  grad  %noun
--
