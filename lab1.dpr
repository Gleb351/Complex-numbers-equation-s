program lab1;

{Разработать модуль для реализации операций с комплексными числами.
Решить квадратное уравнение ax^2+bx+c=0 c комплексными коэффициентами}

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,
  u_complex;

var a,b,c,x1,x2: TComplex;

//Процедура решения линейного уравнения вида: bx+c=0
function LinEquat(b,c: TComplex) : TComplex;
begin
  c:=u_MultComplex(u_InitComplex(-1,0),c);
  Result:=u_DivComplex(c,b);
end;

//Процедура решения квадратного уравнения вида: ax2+bx+c=0
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

//Главная программа
begin
setConsolecp(1251);
setconsoleoutputcp(1251);

//Ввод комплексного числа
u_InPutComplex('Введите 1-ыq коэффициент (комплексное число)', a);
u_InPutComplex('Введите 2-ой коэффициент (комплексное число)', b);
u_InPutComplex('Введите 3-ий коэффициент (комплексное число)', c);
writeln;

//Нахождение решений уравнений
if u_AbsolutComplex(a)=0 then
  If u_AbsolutComplex(b)=0 then
    If u_AbsolutComplex(c)=0 then
      Writeln('x - любые')
    else
      writeln('Решений нет')

  else
    //Решение линейного уравнения
    begin
      writeln('Квадратный корень: ');
      u_PrintComplex(LinEquat(b,c));
    end
else
//Решение квадратного уравнения
  begin
    QuadEquat(a,b,c,x1,x2);
    writeln('Первый квадратный корень: ');
    u_PrintComplex(x1);
    writeln('Второй квадратный корень: ');
    u_PrintComplex(x2);
  end;
readln;
end.
end.
