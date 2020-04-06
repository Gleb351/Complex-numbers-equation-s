program lab1;

{����������� ������ ��� ���������� �������� � ������������ �������.
������ ���������� ��������� ax^2+bx+c=0 c ������������ ��������������}

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,
  u_complex;

var a,b,c,x1,x2: TComplex;

//��������� ������� ��������� ��������� ����: bx+c=0
function LinEquat(b,c: TComplex) : TComplex;
begin
  c:=u_MultComplex(u_InitComplex(-1,0),c);
  Result:=u_DivComplex(c,b);
end;

//��������� ������� ����������� ��������� ����: ax2+bx+c=0
Procedure QuadEquat(a,b,c: TComplex; var x1, x2: TComplex);
var D:Tcomplex;
b1, a1 : Tcomplex;
begin
  D:=u_DiffComplex(u_MultComplex(b,b),u_MultComplex(u_InitComplex(4,0),u_MultComplex(a,c)));
  D:=u_RootComplex(d);
  b1:=u_MultComplex(u_InitComplex(-1,0),b);
  a1:=u_MultComplex(u_InitComplex(2,0),a);
  x1:=u_DivComplex(u_SumComplex(b1,d),a1);
  x2:=u_DivComplex(u_DiffComplex(b1,d),a1);
end;

//������� ���������
begin
setConsolecp(1251);
setconsoleoutputcp(1251);

//���� ������������ �����
u_InPutComplex('������� 1-�q ����������� (����������� �����)', a);
u_InPutComplex('������� 2-�� ����������� (����������� �����)', b);
u_InPutComplex('������� 3-�� ����������� (����������� �����)', c);
writeln;

//���������� ������� ���������
if u_AbsolutComplex(a)=0 then
  If u_AbsolutComplex(b)=0 then
    If u_AbsolutComplex(c)=0 then
      Writeln('x - �����')
    else
      writeln('������� ���')

  else
    //������� ��������� ���������
    begin
      writeln('���������� ������: ');
      u_PrintComplex(LinEquat(b,c));
    end
else
//������� ����������� ���������
  begin
    QuadEquat(a,b,c,x1,x2);
    writeln('������ ���������� ������: ');
    u_PrintComplex(x1);
    writeln('������ ���������� ������: ');
    u_PrintComplex(x2);
  end;
readln;
end.
end.
