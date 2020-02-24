{                  Лабораторная работа N 4
                   Численное интегрирование
                       Правило Симпсона
         Выполнил студент 4 курса группы КАТМА Мукасеева Дарья}

Program prsimps;
var
    a,b,y1,y2,eps     :real;
    g                 :text;
    name              :string;
    n                 :longint;

function f(x:real):real;
   begin
       f:=sqrt(x)*cos(x);
   end;

Procedure simps(a,b:real; var n:longint; var y:real);
var
    i        :longint;
    h,x      :real;
    begin
        h:=(b-a)/n; y:=0; x:=a;
        for i:=1 to n do
        begin
            y:=y+f(x)+4*f(x+0.5*h)+f(x+h);
            x:=x+h
        end;
            y:=y*h/6
    end;
    begin
        write('Введите число частичных отрезков N  '); readln(n);
        write('Введите концы отрезка интегрирования a,b  '); readln(a,b);
        write('Введите условие останова eps  '); readln(eps);
        write('Введите имя выходного файла  '); readln(name);
        assign(g,name); rewrite(g);
        writeln(g,'  Лабораторная работа N 4'); writeln(g);
        writeln(g,'          Численное интегрирование');
        writeln(g,'              Правило Симпсона');
        writeln(g);
        writeln(g,'Выполнил студент 4 курса группы КАТМА Мукасеева Дарья');
        writeln(g);
        writeln(g,'Стартовое число частичных отрезков  ',n);
        writeln(g,'Условие останова eps = ', eps);
        writeln(g);
        simps(a,b,n,y1); n:=2*n; simps(a,b,n,y2);
        while abs(y1-y2)>=eps do
        begin y1:=y2; n:=2*n; simps(a,b,n,y2); writeln(n,' ',abs(y1-y2)) end;
        writeln(g,'Интеграл равен  ',y2); writeln(g);
        writeln(g,'Число частичных отрезков  ',n);
        writeln(g);
        close(g)
end.
