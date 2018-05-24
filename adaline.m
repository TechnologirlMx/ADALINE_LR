%limpiamos la linea de comando y cerramos cualquier ventana generada
%anteriormente
clc;clear all;close all; 

fprintf('FORMATO: .txt\n');
fprintf('\t\t vector target, separado por tabulaciones\n');
dimension=input('\nIngresa la dimension de w\n');
numClases=input('\nIngresa el número de clases\n');
archivo=input('\nIngresa el nombre del archivo entre comillas simples\n');
alpha=.1;
%colocamos en a los datos
a=load(archivo);

for i=1:dimension
    %asignamos la iésima columna de a, a x
    X(:,i)=a(:,i);
end 

%obtenemos las dimensiones de X
[n m]=size(X);
%añadimos una columna de unos

%asignamos el target a D
for k=0:((numClases/2)-1)
    D(:,k+1)=a(:,dimension+1+k);
end
%l columnas de m+1 filas de zeros
w=zeros(m,m);
a=0;
W=w';
b=zeros(numClases/2,1);

%calculamos los pesos
for j=1:100  %número de iteraciones
    
end
e=[-1, -1];
aux=[0, 0];
while e~=0
    e=aux;
    for i=1:n   %número de datos de entrada
        %asignamos la fila i de X(entrada i), a x
        x=X(i,:)';
        %obtenemos el target correspondiente
        d=D(i,:);
        %
        n_n=W*x+b;
        % aplicamos la funcion hardlims
        a=purelin(n_n);
        fprintf('\n\tTarget: ');
        d
        a
        b
        %se aplica la regla de aprendizaje
        %w_new=w_old+error*(entrada_i)              
        e=(d'-a);
        e
        valor=2*alpha*e*x';
        W=W+valor;
        b=b+2*alpha*e;
        i
        j
        W
        b
        x
    end
    j=j+1;
    aux=e;    
end

if n == 2
    %graficamos los resultados
    %obtenemos las x de clase 1
    X1=X(D==1,:);
    %obtenemos las x de clase -1
    X2=X(D==0,:);
    %graficamos la clase 1 de rojo
    scatter(X1(:,1),X1(:,2),'r');
    hold on; grid on;
    %graficamos la clase 2 de azul
    scatter(X2(:,1),X2(:,2),'b');
    title('Perceptrón');
    xlabel('Eje x');
    ylabel('Eje y');
    legend('1-> Clase 1','0 -> Clase 2');
    %dibujamos la frontera de decision 
    p1=-(b/W(1));
    p2=-(b/W(2));
    P_x=[p1 0];
    P_y=[0 p2];
    plot(P_x,P_y);
end  