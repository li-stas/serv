save scre to scusers
clea
store 0 to crs_r,cpr_r
ent_r=gnEnt
netuse('speng',,'s')
netuse('spenge',,'s')
netuse('spenga')
netuse('arms')
netuse('cskl',,'s')
store 0 to kengr,skr,kodr,armr
store 0 to ktor,ktoer
sele speng
set orde to tag t2
go top
rcktor=recn()
ktor=kgr
if gnAdm=1
   for_r='.t.'
else
   for_r='.t..and.speng->ent=20'
endif   
forr=for_r
do while .t.
   setlastkey(4)
   sele speng
   set orde to tag t2
   foot('INS,DEL,ENTER,F3,F4,F5','���,��,����,������,�����,����')
   rcktor=slcf('speng',0,0,19,,"e:kgr h:'���' c:n(4) e:fio h:'�.�.�.' c:c(15) e:prl h:'��஫�' c:c(8) e:adm h:'�' c:n(1) e:cenp h:'�' c:n(1) e:cenr h:'�' c:n(1) e:dkkln h:'���' c:n(3) e:spech h:'���' c:n(2) e:kart h:'��' c:n(1) e:atmrsh h:'M' c:n(1) e:rspo h:'���' c:n(1) e:rspb h:'���' c:n(1) e:rspnb h:'����' c:n(1) e:rsps h:'���' c:n(1) e:rsp h:'��' c:n(1) e:rdsp h:'���' c:n(1) e:rbso h:'���' c:n(1) e:rfp h:'��' c:n(1)",,,1,,forr,,'����������� �������������')
   if empty(ktor)
      ktor=kodr
   endif
   if lastkey()=27
      exit
   endif
   sele speng
   go rcktor
   ktor=kgr
   rnapr=rnap
   if fieldpos('eot')#0
      eotr=eot
   else 
      eotr=space(10)
   endif 
   do case
      case lastkey()>32.and.lastkey()<255
           sele speng
           lstkr=upper(chr(lastkey()))
           if !netseek('t2','lstkr')
              go top
           endif
           loop
      case lastkey()=22 && ins
           ktoins(0)
      case lastkey()=13 && Enter
           ktoins(1)
      case lastkey()=-4 && ����
           uarms()
      case lastkey()=-3 && F4
          *do while .t.
             sele spenge
             seek str(ktor,4)
             if !FOUND()
                netadd()
                repl kgr with ktor,sk with 1
             endif
          do while .t.
             sele spenge
             skr=sk
             netseek('t1','ktor,skr')
             foot('INS,DEL,ENTER,ESC','��������,�������,�����,�⬥��')
             skr=slcf('spenge',,,,,"e:sk h:'SK' c:n(3) e:getfield('t1','spenge->sk','cskl','nskl') h:'�����' c:c(20) e:wh h:'�' c:n(1) e:getfield('t1','spenge->sk','cskl','ent') h:'ENT' c:n(2)",'sk',,1,'kgr=ktor')
             if empty(skr)
                skr=kodr
             endif
             do case
                case lastkey()=27
                     exit
                case lastkey()=13
                     save scre to scd
                     sele spenge
                     netseek('t1','ktor,skr')
                     whr=wh
                     rest scre from scd
                     @ row(),50 get whr color 'r/w'
                     read
                     if lastkey()#27
                        reclock()
                        repl wh with whr
                        unlock
                     endif
                     rest scre from scd
                     loop
                case lastkey()=22 && ins
                     ktoeins(0)
                     sele sl
                     go top
                     do while !eof()
                        skr=val(kod)
                        sele spenge
                        netseek('t1','ktor,skr')
                        if !FOUND()
                           netadd()
                           repl kgr with ktor,sk with skr
                        endif
                        sele sl
                        skip
                     endd
                     zap
                     use
                     loop
                case lastkey()=7  && del
                     sele spenge
                     netseek('t1','ktor,skr')
                     if FOUND()
                        netdel()
                        skip
                     endif
                     loop
             endc
          endd
          sele speng
          go rcktor 
      case lastkey()=7.and.ktor#0  && del
           sele spenge
           seek str(ktor,4)
           if FOUND()
              do while kgr=ktor
                 netdel()
                 skip
              enddo
           endif
           sele speng
           seek ktor
           if FOUND()
              netdel()
              skip -1
              if bof()
                 go top 
              endif        
           endif
           loop
      case lastkey()=-2  && ������
           if gnAdm=1
              usrflt()   
           endif   
   endc
endd
nuse()

func usrflt()
clufr=setcolor('w/b,n/w')
wufr=wopen(8,10,18,70,.t.)
wbox(1)
@ 0,1 say '�।���⨥' get ent_r pict '99'
@ 1,1 say '���� � ���' get crs_r pict '9'
@ 2,1 say '���� � ���' get cpr_r pict '9'
read
wclose(wufr)
setcolor(clufr)
forr=for_r
if ent_r#0
   if ent_r#99 
      forr=forr+'.and.ent=ent_r'
   else
      forr=forr+'.and.ent=0'
   endif   
endif
if crs_r#0
   forr=forr+'.and.cenr=1'
endif
if cpr_r#0
   forr=forr+'.and.cenp=1'
endif
sele speng
go top
rcktor=recn()
retu .t.
**************
func uarms()
**************
sele spenga
if !netseek('t1','ktor')
   go top
endif
rcar=recn()
do while .t.
   sele spenga
   go rcar
   foot('INS,DEL','���,��')
   rcar=slcf('spenga',,5,,,"e:spenga->arm h:'���' c:n(2) e:getfield('t1','spenga->arm','arms','nai') h:'������������' c:c(20) e:getfield('t1','spenga->arm','arms','name') h:'���' c:c(10) e:getfield('t1','spenga->arm','arms','fox') h:'FOX' c:n(1) e:getfield('t1','spenga->arm','arms','na') h:'NA' c:n(1)",,,1,'kgr=ktor',,,'����')
   if lastkey()=27
      exit
   endif
   go rcar
   armr=arm
   do case
      case lastkey()=22 && ins
           uarmsi()
      case lastkey()=7  && del
           netdel()
           skip -1
           if kgr#ktor.or.bof()
              netseek('t1','ktor')           
           endif
           rcar=recn()
   ends
endd
retu .t.
**************
func uarmsi()
**************
save scre to scuai
if select('sl')=0
   sele 0
   use _slct alia sl excl
endif
sele sl
zap
sele arms
go top
rec_r=recn()
do while .t.
   foot('SPACE,ESC','�⡮�,�⬥��')
   armr=slcf('arms',1,35,19,,"e:arm h:'���' c:n(2) e:nai h:'������������' c:c(20) e:name h:'���' c:c(10) e:fox h:'FOX' c:n(1) e:na h:'NA' c:n(1)",'arm',1,1)
   netseek('t1','armr')
   rec_r=recn()
   do case
      case lastkey()=27
           exit
      case lastkey()=22
           go rec_r
           loop
      case lastkey()=13     
           sele sl
           go top
           do while !eof()
              armr=val(kod)
              sele spenga
              if !netseek('t1','ktor,armr')
                 netadd()
                 repl kgr with ktor,arm with armr
              endif
              sele sl
              skip
           endd
           zap
           use
           sele spenga
           netseek('t1','ktor')
           rcar=recn()
           exit
   endc
enddo
rest scre from scuai
retu .t.
