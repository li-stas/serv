/***********************************************************
 * �����    : brands.prg
 * �����    : 0.0
 * ����     :
 * ���      : 02/07/18
 * �������   :
 * �ਬ�砭��: ����� ��ࠡ�⠭ �⨫�⮩ CF ���ᨨ 2.02
 */

#include "inkey.ch"
// �७�� ��મ��ঠ⥫��
save screen to svscbr
clea
/*
*sele brnac
*if recc()=0
*   netadd()
*endif
*/
sele brand
set orde to tag t2
if (!netseek('t2', 'mkeepr'))
  go top
/*
*   netadd()
*   netrepl('mkeep','mkeepr')
*/
endif

rcbrandr=recn()
while (.t.)
  sele brand
  set orde to tag t2
  go rcbrandr
  foot('ENTER,INS,DEL,F4', '���⠢,���.,��.,����')
  // rcbrandr=slcf('brand',1,1,18,,"e:brand h:'���C' c:n(4) e:nbrand h:'������������' c:�(40) e:mkbrand h:'������' c:n(10) e:getfield('t1','brand->brand','brnac','nac') h:'��1' c:n(6,2) e:getfield('t1','brand->brand','brnac','nac1') h:'��2' c:n(6,2) e:getfield('t1','brand->brand','brnac','minzen1') h:'�' c:n(1)",,,1,'mkeep=mkeepr',,,alltrim(nmkeepr))
  rcbrandr:=slcf('brand', 1, 1, 18,, "e:brand h:'���C' c:n(4) e:nbrand h:'������������' c:�(35) e:mkbrand h:'������' c:n(10) e:grbrand h:'��' c:n(2) e:codelist h:'���᮪ ��⥩' c:�(20)",,, 1, ;
                  'mkeep=mkeepr',,, alltrim(nmkeepr)                                                                                                                                            ;
               )
  if (lastkey()=K_ESC)
    exit
  endif

  sele brand
  go rcbrandr
  brandr=brand
  nbrandr=nbrand
  mkbrandr=mkbrand
  grbrandr=grbrand
  codelistr:=codelist
  /*
  *   sele brnac
  *   if !netseek('t1','brandr')
  *      netadd()
  *      netrepl('brandr')
  *   endif
  *   nacr=nac
  *   nac1r=nac1
  *   minzen1r=minzen1
  *   ftxtr=ftxt
  *   sele brand
  */
  do case
  case (lastkey()=K_INS)  // ��������
    BrandIns(0)
  case (lastkey()=K_F4)   // ���४��
    BrandIns(1)
  case (lastkey()=K_ENTER)// C��⠢
    BrandBody()
  case (lastkey()=K_DEL)  // �������
    sele ctov
    set orde to tag t7
    while (netseek('t7', 'brandr'))
      netrepl('brand', '0')
    enddo

    sele brand
    netdel()
    skip -1
    if (bof().or.mkeep#mkeepr)
      if (!netseek('t2', 'mkeepr'))
        rcbrandr=recn()
      endif

    endif

    rcbrandr=recn()
  endcase

enddo

rest screen from svscbr

/***********************************************************
 * BrandIns() -->
 *   ��ࠬ���� :
 *   �����頥�:
 */
function BrandIns(p1)
  //local getlist:={}
  if (p1=0)
    brandr=0
    grbrandr=0
    nbrandr=space(40)
    mkbrandr=0
    grbrandr=0
    nacr=0
    nac1r=0
    minzen1r=0
    ftxtr=space(20)
    codelistr:=space(64)
    //else
  //codelistr:=codelist
  endif

  scbrinsr=setcolor('gr+/b,n/w')
  wbrinsr=wopen(8, 10, 14, 70)
  wbox(1)
  while (.t.)
    if (empty(p1))
      @ 0, 1 say '��� �७�� ᢮� '+' '+str(brandr, 10)
    else
      @ 0, 1 say '��� �७�� ᢮� ' get brandr pict '9999999999'
    endif

    @ 1, 1 say '������������    ' get nbrandr
    @ 2, 1 say '��� �७�� ���. ' get mkbrandr pict '9999999999'
    @ 3, 1 say '��㯯� ᢮�     ' get grbrandr pict '99' valid brgrbr()
    @ 4, 1 say '���᮪ ��� ���� ' get codelistr pict '@S20 XXXXXXXXXXXXXXXXXXXX'
    /*
     *   @ 3,1 say '������1         '  get nacr pict '999.99'
     *   @ 4,1 say '������1         '  get nac1r pict '999.99'
     *   @ 5,1 say '���. 業�       '  get minzen1r pict '9'
     *   @ 6,1 say '�᭮�����       '  get ftxtr
     */
    read
    if (lastkey()=K_ESC)
      exit
    endif

    if (p1=0)
      sele cntcm
      go top
      if (brand=0)
        netrepl('brand', '1')
      endif

      while (.t.)
        reclock()
        brandr=brand
        netrepl('brand', 'brand+1')
        if (!netseek('t1', 'brandr', 'brand'))
          exit
        endif

        sele cntcm
      enddo

    endif

    sele brand
    if (p1=0)
      netadd()
      netrepl('mkeep,brand', 'mkeepr,brandr')
    endif

    netrepl('nbrand,mkbrand,grbrand,codelist', 'nbrandr,mkbrandr,grbrandr,codelistr')
    rcbrandr:=recn()
    exit
  enddo

  wclose(wbrinsr)
  setcolor(scbrinsr)
  return (.t.)

/***********************************************************
 * BrandBody() -->
 *   ��ࠬ���� :
 *   �����頥�:
 */
function BrandBody()
  sele ctov
  set orde to tag t6
  if (netseek('t6', 'mkeepr'))
    rcctovr=recn()
  else
    rcctovr=1
  endif

  while (.t.)
    foot('INS,DEL', '���.,��.')
    sele ctov
    go rcctovr
    rcctovr=slcf('ctov', 3, 5, 10,, "e:mntov h:'���' c:n(7) e:nat h:'������������' c:�(40) e:merch h:'M' c:n(1)",,, 1, ;
                  'mkeep=mkeepr', 'brand=brandr',, str(brandr, 10)+' '+alltrim(nbrandr)                             ;
               )
    if (lastkey()=K_ESC)
      exit
    endif

    sele ctov
    go rcctovr
    do case
    case (lastkey()=K_INS)// ��������
      if (select('sl')=0)
        sele 0
        use _slct alias sl excl
      endif

      sele sl
      zap
      sele ctov
      if (netseek('t6', 'mkeepr'))
        rcctovrr=recn()
      else
        rcctovrr=1
      endif

      foot('SPACE,ENTER,ESC', '�⡮�,�믮�����,�⬥��')
      while (.t.)
        rcctovrr=slcf('ctov', 5, 10, 10,, "e:mntov h:'���' c:n(7) e:nat h:'������������' c:c(40) e:merch h:'M' c:n(1) ",, 1,, 'mkeep=mkeepr', 'brand=0')
        sele ctov
        go rcctovrr
        if (lastkey()=K_ENTER)
          sele sl
          go top
          while (!eof())
            rcctovrr=val(kod)
            sele ctov
            go rcctovrr
            netrepl('brand', 'brandr')
            sele sl
            skip
          enddo

          exit
        endif

        if (lastkey()=K_ESC)
          exit
        endif

      enddo

      sele ctov
      if (netseek('t6', 'mkeepr'))
        rcctovr=recn()
      else
        rcctovr=1
      endif

    case (lastkey()=K_DEL)// �������
      netrepl('brand', '0')
      skip -1
      if (bof())
        go top
      endif

      rcctovr=recn()
    endcase

  enddo

  return (.t.)

/*************** */
function brgrbr()
  /*************** */
  oldwr=wselect(0)
  if (grbrandr#0)
    sele grbr
    if (!netseek('t1', 'mkeepr,grbrandr'))
      grbrandr=0
    endif

  endif

  if (grbrandr=0)
    sele grbr
    if (netseek('t1', 'mkeepr'))
      rcgrbrr=recn()
      while (.t.)
        sele grbr
        go rcgrbrr
        foot('�NTER', '�롮�')
        rcgrbrr=slcf('grbr', 1, 30,,, "e:grbrand h:'���' c:n(2) e:ngrbrand h:'������������' c:�(40)",,,, 'mkeep=mkeepr',,, '��㯯� �७���')
        if (lastkey()=K_ESC)
          exit
        endif

        if (lastkey()=K_ENTER)
          go rcgrbrr
          grbrandr=grbrand
          exit
        endif

      enddo

    endif

  endif

  wselect(wbrinsr)
  return (.t.)
