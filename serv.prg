* MENU[1],MENU[2] ��१�ࢨ஢���
*
para exer
clea
if empty(exer)
   ?'������� START.BAT'
   inkey(3)
   retu
endif
if upper(exer)#'S'
   ?'������� START.BAT'
   inkey(3)
   retu
endif


gnArm=25

priv menu[9]

MENU[3] := "������"
MENU[4] := "��"
MENU[5] := "�������"
MENU[6] := "�����"
MENU[7] := "�����"
MENU[8] := "���⠢��"
MENU[9] := "��"

lmenur=len(menu)   && ������⢮ pad
priv CL_L[lmenur]  && ������ pad
priv sizam[lmenur] && ������⢮ bar



priv menu3[11]
MENU3[1]  := "������          "
MENU3[2]  := "��������        "
MENU3[3]  := "��⥣�ਨ ��    "
MENU3[4]  := "���४��       "
MENU3[5]  := "������ ����   "
MENU3[6]  := "������� �த��"
MENU3[7]  := "���ࢫ����      "
MENU3[8]  := "������          "
MENU3[9]  := "���� �� SV      "
MENU3[10] := "���짮��⥫�    "
MENU3[11] := "�㯥ࢠ�����    "

priv menu4[9]
MENU4[1] := "��મ��ঠ⥫�"
MENU4[2] := "��業��       "
MENU4[3] := "������ ���� "
MENU4[4] := "���⪨ �� �� "
MENU4[5] := "�� ��� �� ��. "
MENU4[6] := "���� j:\ost   "
MENU4[7] := "mkkplkgp(27)  "
MENU4[8] := "TPOK(27) ���� "
MENU4[9] := "TPOK(27) ����K"

priv menu5[13]
MENU5[1] := "���⥫�騪�    "
MENU5[2] := "��㧮�����⥫�"
MENU5[3] := "���.���� (��)"
MENU5[4] := "��ࠢ�筨�     "
MENU5[5] := "���⠢騪�     "
MENU5[6] := "������         "
MENU5[7] := "��� ��㧮�����"
MENU5[8] := "������ ᯨ᪮� "
MENU5[9] := "������ �� ��. "
MENU5[10] := "��� ���⥫��."
MENU5[11] := "��樨 - ᯨ᮪"
MENU5[12] := "��樨 - ⮢�� "
MENU5[13] := "��樨 - ��    "

priv menu6[6]
MENU6[1] := "���� �த�樨"
MENU6[2] := "CROSID        "
MENU6[3] := "��� �����    "
MENU6[4] := "�����(CTOV)   "
MENU6[5] := "POS BRAND     "
MENU6[6] := "POS ID        "

priv menu7[3]
MENU7[1] := "���� ����⨪�"
MENU7[2] := "���४�� CTOV "
MENU7[3] := "���� ��ப     "

priv menu8[12]
MENU8[1] := "������� �����"
MENU8[2] := "���⠢��      "
MENU8[3] := "��������      "
MENU8[4] := "���� �� ��砫�"
MENU8[5] := "���� ⥪���  "
MENU8[6] := "��.���� ��㧮�"
MENU8[7] := "��.��㧮����  "
MENU8[8] := "��.�����/��� "
MENU8[9] := "��.��ᯮ��    "
MENU8[10] := "��.������     "
MENU8[11] := "��.������ ���"
MENU8[12] := "��.������ ���."

priv menu9[1]
MENU9[1] := "��࣮�� ��ન"

SIZAM[3] := len(menu3)
SIZAM[4] := len(menu4)
SIZAM[5] := len(menu5)
SIZAM[6] := len(menu6)
SIZAM[7] := len(menu7)
SIZAM[8] := len(menu8)
SIZAM[9] := len(menu9)

maine()
