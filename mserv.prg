If Lastkey()=13
   Do Case
      Case I = 3   //������
           Do case
              case pozicion=1
                   stag()  //������
              case pozicion=2
                   smarsh()  //��������
              case pozicion=3
                   kgpcat()  //��⥣�ਨ �� stag.prg
              case pozicion=4
                   agcor() && sprod.prg
*                   focus()  //������ ��㯯�
              case pozicion=5
                   amplan()  //������ ����� ����⮢
              case pozicion=6
                   sprod()   //������� �த��
              case pozicion=7
                   nap()   //napprod.prg ���ࠢ�����
              case pozicion=8
                   if gnEnt=20
                      bon()
                   endif
              case pozicion=9
                   svplan() && amplan.prg
              case pozicion=10
                   if gnKto=160.or.gnAdm=1
                      users()  && adm/comm/users.prg
                   endif
              case pozicion=11
                   sv() && agent\bon.prg
           endc
      Case I = 4   //����⮢�⥫�
           do case
              case pozicion=1
                   mkeep()  //��મ��ঠ⥫�
              case pozicion=2
                   brnac()  //���.�� �७��
              case pozicion=3
                   mmplan()  //������ ����� ��મ��ঠ⥫��
              case pozicion=4
                   #ifndef __CLIP__
*                   mkostd() &&mkcros()  //���� ⠡��� ⮢��
                   #endif
              case pozicion=5
                   mkdt()
*                   mkd()
*                   if gnAdm=1
*                      mkotchda()
*                   endif
              case pozicion=6
                   crjost() && mkotchd.prg
              case pozicion=7
                   mkkplkgp(27)
              case pozicion=8
                   tpokkeg()
              case pozicion=9
                   tpokkegk()
           endc
      Case I = 5   //�������
           do case
              case pozicion=1
                   klnnac()  //��業��
              case pozicion=2
                   kgp()  //��㧮�����⥫�
              case pozicion=3
                   tmesto()
              case pozicion=4
 //                   if gnAdm=1
                      s_kln()  //��ࠢ�筨�
 //                   endif
              case pozicion=5
                   kps()
              case pozicion=6
                   s_krn()
              case pozicion=7
                   kgpnet()  // kgp.prg
              case pozicion=8.and.(gnAdm=1.or.gnKto=848)
                   skidlst()  // kps.prg
              case pozicion=9.and.(gnAdm=1.or.gnKto=848)
                   skidusl()  // kps.prg
              case pozicion=10
                   chst()  // kgp.prg
              case pozicion=11
                   a_IdAct()  //
              case pozicion=12
                   a_Prod() //
              case pozicion=13
                   a_TT()  //
           endc
      Case I = 6   //�����
           do case
              case pozicion=1
                   vid()     //���� �த�樨
              case pozicion=2
                   sinctov() //CROSID
              case pozicion=3
*                   if gnAdm=1
                      qtost() && sklad/rs/sp_ttn && ����� ���� ��� ����������
*                      analitp()   //�����⨪�(�����⮢��)
*                   endif
              case pozicion=4
                   s_ctov()
              case pozicion=5
                   posbrn()
*                   if gnAdm=1
*                      analit()   //�����⨪�(����ன��)
*                   endif
              case pozicion=6
                   posid()
           endc
      Case I = 7   //����⨪�
           do case
              case pozicion=1
                   sstat()   //���� ����⨪�
              case pozicion=2
                   crctov()  //���४�� CTOV
              case pozicion=3
                   krstat()  //���� ��ப
           endc
      Case I = 8   //���⠢��
           do case
              case pozicion=1
                   cmrsh()      //�������� �����
              case pozicion=2
                   kgpsk()      //���⠢��
              case pozicion=3
                   vmrsh()      //��������   
              case pozicion=4
                   if gnAdm=1 
                      crmrshn()   //���� ���
                   endif
              case pozicion=5
                   if gnAdm=1
                      crmrsht()   //���� ⥪
                   endif  
              case pozicion=6.and.gnEnt=20 && atsl.prg
                   slto()
              case pozicion=7.and.gnEnt=20 && atsl.prg
                   slo()
              case pozicion=8.and.gnEnt=20 && atsl.prg
                   slp() 
              case pozicion=9.and.gnEnt=20 && atsl.prg
                   sltxt() 
              case pozicion=10.and.gnEnt=20 && atsl.prg
                   routes() 
              case pozicion=11.and.gnEnt=20 && atsl.prg
                   slord() 
              case pozicion=12.and.gnEnt=20 && atsl.prg
                   slrout() 
           endc
    EndCase
    keyboard chr(5)
EndIf
Return .T.
