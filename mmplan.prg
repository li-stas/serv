* ������ ����� �� ��મ��ঠ⥫�
clea 

netuse('mkeep')
netuse('bmplan')
netuse('brand')


sele mkeep
set orde to tag t2
go top
rcmkeepr=recn()
do while .t.
   sele mkeep
   go rcmkeepr
   foot('ENTER','�७��')
   rcmkeepr=slcf('mkeep',1,1,18,,"e:mkeep h:'���' c:n(3) e:nmkeep h:'������������' c:�(20)",,,1,,,,'��મ��ঠ⥫�') 
   sele mkeep
   go rcmkeepr
   mkeepr=mkeep
   nmkeepr=nmkeep
   do case
      case lastkey()=27
           exit
      case lastkey()=13 && ���� �� �७���
           save scree to scbmplan    
           bmplanm()
           rest scree from scbmplan    
   endc
endd

nuse()

**************
* �㭪樨
**************

func bmplanm()
sele brand
set orde to tag t2
if netseek('t2','mkeepr')
   do while mkeep=mkeepr
      brandr=brand  
      sele bmplan
      if !netseek('t1','mkeepr,0,0,brandr')   
         netadd()
         netrepl('mkeep,brand','mkeepr,brandr') 
      endif   
      sele brand
      skip  
   endd
endif
sele bmplan
netseek('t1','mkeepr,0,0')
rcbrandr=recn()
do while .t.
   sele bmplan
   go rcbrandr
   foot('ENTER','����')
   rcbrandr=slcf('bmplan',1,1,18,,"e:brand h:'���' c:n(10) e:getfield('t1','bmplan->brand','brand','nbrand') h:'������������' c:c(38) e:bmplan->kol h:'����' c:n(12,3) e:bmplan->kolk h:'����' c:n(12,3)",,,1,'mkeep=mkeepr.and.kfent=0.and.kta=0',,,alltrim(nmkeepr)) 
   if lastkey()=27
      exit
   endif
   go rcbrandr
   brandr=brand
   kolr=kol
   sumr=sum
   kolkr=kolk
   sumkr=sumk
   do case
      case lastkey()=13 
           @ row(),52 get kolr pict '99999999.999' color 'r/bg'  
           read
           if lastkey()=13    
              netrepl('kol','kolr') 
           endif  
   endc   
endd   
retu .t.
