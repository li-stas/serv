* ����⨪�
clea
netuse('nei')
netuse('krstat')
rckrstatr=recn()
do while .t.
   foot('INS,DEL,F4','��������,�������,���४��')
   go rckrstatr
   rckrstatr=slcf('krstat',,,,,"e:krstat h:'���' c:n(4) e:nstat h:'������������' c:�(40) e:getfield('t1','krstat->keistat','nei','nei') h:'��.�' c:c(5)",,,1,,,,'���� ��ப')
   go rckrstatr
   krstatr=krstat
   nstatr=nstat
   keistatr=keistat
   do case
      case lastkey()=27
           exit
      case lastkey()=22 && INS
           krstins()   
           rckrstatr=recn()
      case lastkey()=-3 && CORR
           krstins(1)   
      case lastkey()=7  && DEL 
           netdel()
           skip -1
           if bof()
              go top 
              rckrstatr=recn()
           endif
   endc
   
endd
nuse()

func krstins(p1)
if p1==nil
   krstatr=0
   nstatr=space(40)
   keistatr=0
endif
clsti=setcolor('gr+/b,n/w')
wsti=wopen(10,20,15,60)
wbox(1)
do while .t.
   if p1==nil
      @ 0,1 say '���         ' get krstatr pict '9999'
   else
      @ 0,1 say '���         '+' '+str(krstatr,4)
   endif   
   @ 1,1 say '������������' get nstatr 
   @ 2,1 say '������ ���.' get keistatr pict '999' valid keistat()
   @ 2,20 say getfield('t1','keistatr','nei','nei')
   read
   @ 2,20 say getfield('t1','keistatr','nei','nei')
   if lastkey()=27
      exit
   endif
   @ 3,1 prom '��୮'
   @ 3,col()+1 prom '�� ��୮'
   menu to vn
   sele krstat
   if lastkey()=27
      exit
   endif
   if vn=1
      if p1==nil
         locate for krstat=krstatr
         if foun()
            wmess('����� ��� 㦥 ����',1)
         else
            netadd()
            netrepl('krstat,nstat,keistat','krstatr,nstatr,keistatr')  
            exit
         endif        
      else
         netrepl('nstat,keistat','nstatr,keistatr')  
         exit  
      endif   
   endif   
enddo
wclose(wsti)
setcolor(clsti)
retu .t.

func keistat()
wselect(0)
sele nei
if !netseek('t1','keistatr')
   keistartr=0
else
   retu .t.   
endif
sele nei
go top
rcneir=recn()
do while .t.
   go rcneir
   foot('INS,F4','��������,���४��')
   rcneir=slcf('nei',,,,,"e:kei h:'���' c:n(3) e:nei h:'���' c:c(5)")
   go rcneir
   keistatr=kei
   do case
      case lastkey()=27.or.lastkey()=13
           exit
      case lastkey()=22
           neiins()
           rcneir=recn()
      case lastkey()=-3
           neiins(1)
   endc
enddo
wselect(wsti)
retu .t.

func neiins(p1)
local getlist:={}
if p1=nil
   keir=1
   neir=space(5)
endif
oclkeir=setcolor('gr+/b,n/w')
wkeir=wopen(10,20,14,60)
wbox(1)
do while .t.
   @ 0,1 say '���          '+str(keir,3)
   @ 1,1 say '������������' get neir
   read
   if lastkey()=27
      exit
   endif
   @ 2,20 prom '��୮'
   @ 2,col()+1 prom '�� ��୮'
   menu to vn
   if lastkey()=27
      exit
   endif
   if vn=1
      neir=uppe(neir)
      if p1=nil
         set orde to tag t1
         go top
         do while !eof()
            if kei#keir
               exit
            endif
            keir++
            skip
         endd
         netadd()
         netrepl('kei,nei','keir,neir')
      else
         netseek('t1','keir')
         if FOUND()
            netrepl('nei','neir')
         endif
      endif
      exit
   endif
endd
wclose(wkeir)
setcolor(oclkeir)
wselect(0)
retu .t.
