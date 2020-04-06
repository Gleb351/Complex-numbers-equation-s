unit u_complex;

interface

uses
  SysUtils;

type
  //������������� ������������ ����� � ����: re � �������������� �����, im � ������

  TComplex=record
  re, im:real;

end;

//������������ �����
function u_InitComplex(re1, im1:real):TComplex;

//���� �����. �����
procedure u_InputComplex(massage:string; var aRes:TComplex);

//������ �����. �����
procedure u_PrintComplex(a: TComplex);

//����� ���� �����. �����
function u_SumComplex(a, b:TComplex):TComplex;

//�������� ���� �����. �����
function u_DiffComplex(a, b:TComplex):TComplex;

//������������ ���� �����. �����
function u_MultComplex(a, b:TComplex):TComplex;

//������� ���� �����. �����
function u_DivComplex(a, b:TComplex):TComplex;

//������ �� �����. �����
function u_RootComplex(a:TComplex):TComplex;

//������ �����. �����
function u_AbsolutComplex(a:TComplex):real;

implementation

  //������������� �����
  function u_InitComplex(re1, im1: real):TComplex;

  begin
    result.re:=re1;
    result.im:=im1;
  end;

  //���� �����. �����
  procedure u_InPutComplex(massage:string; var aRes:Tcomplex);

  begin
    writeln(massage);
    writeln('������� �������������� �����');
    readln(aRes.re);
    writeln('������� ������ �����');
    readln(aRes.im);
  end;

  //������ �����. �����
  procedure u_PrintComplex(a: TComplex);

  begin
  if a.im=-1 then
    if a.re=0 then
      writeln('-i') //-i
    else
      writeln(a.re:0:2,'-i') //a-i
  else
  if a.im=1 then
    if a.re=0 then
      writeln('i') //i
    else
      writeln(a.re:0:2,'+i') //a+i
  else
    if a.im=0 then
      writeln(a.re:0:2) //a
    else
      if a.re=0 then
        writeln(a.im:0:2,'i') //bi
      else
        if a.im<0 then
          writeln(a.re:0:2,a.im:0:2,'i') //a-bi
        else
          writeln(a.re:0:2,'+',a.im:0:2,'i'); //a+bi
  end;

//����� ���� �����. �����
function u_SumComplex(a, b:TComplex):TComplex;
begin
  result.re:=a.re+b.re;
  result.im:=a.im+b.im;
end;

//�������� ���� �����. �����
function u_DiffComplex(a, b:TComplex):TComplex;
begin
  result.re:=a.re-b.re;
  result.im:=a.im-b.im;
end;

//������������ ���� �����. �����
function u_MultComplex(a, b:TComplex):TComplex;
begin
  result.re:=a.re*b.re-a.im*b.im;
  result.im:=a.im*b.re+a.re*b.im;
end;

//������� ���� �����. �����
function u_DivComplex(a, b:TComplex):TComplex;
var zn: real;
begin
  zn:=(b.re*b.re+b.im*b.im);
  if zn = 0 then
    raise exception.Create('������. ���������� ������� �� ����');
  result.re:=(a.re*b.re+a.im*b.im)/zn;
  result.im:=(a.im*b.re-a.re*b.im)/zn;
end;

//������ �� �����. �����
function u_RootComplex(a:TComplex):TComplex;
var z: real;
begin
  z:=sqrt(sqr(a.re)+sqr(a.im));
  result.re:=sqrt((z+a.re)/2);
  result.im:=sqrt((z-a.re)/2);
end;

//������ �� ������������ �����
function u_AbsolutComplex(a:TComplex):real;
begin
  result:=sqrt(sqr(a.re)+sqr(a.im));
end;
end.
end.
