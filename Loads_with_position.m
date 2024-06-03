function Loads_with_postion(varargin)
global n;
format shortG
for k = 1:length(varargin)
x(k) = varargin{k}(1); % Cell array indexing
L(k) = varargin{k}(2);
j=nargin;
J=j-4;
while J>0
   error('This program is designed for design of shafts with maximum of 4 loads please revise your input loads');
end
   if(x(k)~=0)
switch L(k)
        case 1
            fprintf('-------------------------calculating the loads on the shaft dueto the pulley at %dm -------------------------\n',x(k)')
            pp(k)=input('pleas enter the power transmitted by the pulley in watt=');
            while size(pp(k))==[0 0]
                disp('Error you cannot leave the power empty')
                pp(k)=input('enter valid non zero non-negative power transmitted by the pulley in watt,p=')
            end
            while isnumeric(pp(k))==0
                disp('Error invalid input for the power of the pulley');
                pp(k)=input('enter valid non-zero non-negative power transmitted by the pulley in watt,p=');
            end
            while pp(k)<=0
                disp('Error invalid input for power ')
                pp(k)=input('enter valid non zero non-negative power transmitted by the pulley in watt,p=');
            end
            T(k)=(60*pp(k))/(2*pi*n);
            Dp(k)=input('pleas enter the diameter of the pulley in meter,D=');
            while size(Dp(k))~=[1 1]
                 disp('Error you cannot leave the diameter empty');
                 Dp(k)=input('enter valid non-zero non-negative diameter of the pulley in m,D=');
            end 
             while isnumeric(Dp(k))==0
                 disp('Error invalid input for diameter');
                 Dp(k)=input('Enter a valid non-zero non-negative diameter of the pulley in m,D=');
             end
            while  Dp(k)<=0
                disp('Error invalid dimension for the diameter of the pulley')
                 Dp(k)=input('enter valid non-zero non-negative diameter of the pulley in m,D=');
            end
            a(k)=input('please enter the ratio of the belt tension of the pulley(T1/T2)='); % T2 is the tension at the slack side 
            while  a(k)<=0
                disp('Error tension ratio cannot be zero or negative')
                a(k)=input('Enter valid non-zero non-negative tensiion ratiio,a=');
            end
            while size(a(k))==[0 0]
                disp('Error you cannot leave the tension ratio empty');
                a(k)=input('Enter valid non-zero non-negative tension ratiio,a=');
            end
            while isnumeric(a(k))==0
                disp('Error invalid input for tension ratio');
                a(k)=input('Enter valid non-zero non-negative tension ratio,a=');
            end
            mp(k)=input('please enter the mass of the pulley in Kg if it is neglegible enter 0 m=');
            while  mp(k)<0
                disp('Error mass cannot be negative')
                 mp(k)=input('enter valid non-negative value for the mass of the pulley in Kg,m=');
            end
            while size(mp(k))==[0 0]
                disp('Error you cannot leave the mass empty');
                mp(k)=input('Enter valid non-negative value for the mass of the pulley in Kg,D=');
            end
            while isnumeric(mp(k))==0
                disp('Error invalid input for diameter of the pulley');
                mp(k)=input('Enter valid non-negative value for the mass of the pulley in Kg,m=');
            end
            wp(k)=mp(k)*9.81;
            T2(k)=(2*T(k))/((a(k)-1)*Dp(k));
            T1(k)=a(k)*T2(k);
            fprintf('The torque transmitted by the gear is %dNm \n',T(k));
            fprintf('The tension at the tension side of the pulley is T1=%dN\n',T1(k));
            fprintf('The tension at the slack side of the belt T2=%dN\n',T2(k));
            angle1(k)=input('please enter the angle of the tension side of the belt with respect to positive x-axis in degree=');
            while size(angle1(k))==[0 0]
                disp('Error you cannot leave the angle of the tension side empty');
                angle1(k)=input('Enter valid angle of the tension side of the belt with respect to positive x-axis in degree=');
            end
            while isnumeric(angle1(k))==0
                disp('Error invalid input for angle');
                angle1(k)=input('Enter valid angle of the tension side of the belt with respect to positive x-axis in degree=');
            end
            T1v(k)=T1(k)*(sind(angle1(k)));
            T1h(k)=T1(k)*(cosd(angle1(k)));
            angle2(k)=input('please enter the angle of the slack side of the belt with respect to positive x-axis in degree=');
            while size(angle2(k))==[0 0]
                disp('Error you cannot leave it empty');
                angle1(k)=input('Enter valid angle of the slack side of the belt with respect to positive x-axis in degree=');
            end
            while isnumeric(angle2(k))==0
                disp('Error invalid input for angle');
                angle2(k)=input('Enter valid angle of the slack side of the belt with respect to positive x-axis in degree=');
            end
            T2v(k)=T2(k)*(sind(angle2(k)));
            T2h(k)=-T2(k)*(cosd(angle2(k)));
            Tv(k)=T1v(k)+T2v(k)-wp(k);
            Th(k)=T1h(k)+T2h(k);
            if (Tv(k)>0)
                Fv(k)=Tv(k);
                fprintf('The vertical load applied at the location of the pulley (at x=%dm) by the belt transmission is Fv=%dN In the upward direction\n',x(k),Tv(k));
            elseif (Tv(k)<0)
                Fv(k)=Tv(k);
                absTv(k)=-1*Tv(k);
                fprintf('The vertical load applied at the location of the pulley (at x=%dm) by the belt transmission is Fv=%dN In the downward direction\n',x(k),absTv(k));
            else Fv(k)=0;
                fprintf('The vertical load applied at the location of the pulley (at x=%dm) by the belt transmission is Fv=%dN\n',x(k),Fv(k));
            end
            if (Th(k)>0)
                Fh(k)=Th(k);
                fprintf('The horizontal load applied at the location of the pulley(at x=%dm) by the belt transmission is Fh=%dNm In the positive x-direction\n',x(k),Th);
            elseif (Th(k)<0)
                absTh(k)=-1*Th(k);
                Fh(k)=abs(Th(k));
                fprintf('The horizontal load applied at the location of the pulley(at x=%dm) by the belt transmission is Fh=%dNm In the negative x-direction direction\n',x(k),absTh(k));
            else Fh(k)=0;
                fprintf('The horizontal load applied at the location of the pulley(at x=%dm) by the belt transmission is Fh=%dNm\n',x(k),Fh(k));
            end
        case 2
           fprintf('-------------------------calculating the loads on the shaft due to the gear transmission system at x= %dm-------------------------\n',x(k));
           pg(k)=input('Enter the power transmitted by the gear mechanism in watt p=');
           while isnumeric(pg(k)==0)
                disp('Error invalid input for diameter of the gear');
                pg(k)=input('Enter valid non zero non-negative power transmitted by the gear in watt,p=');
            end 
           while pg(k)<=0
                disp('Error invalid input power ')
                pg(k)=input('Enter valid non zero non-negative power transmitted by the gear in watt,p=');
             end
            while size(pg(k))~=[1 1]
                disp('Error you cannot leave the it empty');
                pg(k)=input('enter valid non zero non-negative power transmitted by the gear in watt,p=');
            end
            T(k)=(60*pg(k))/(2*pi*n);
            Dg(k)=input('pleas enter the pitch diameter of the gear in meter=');
            while  Dg(k)<=0
                disp('Error, invalid dimension for the diameter of the gear')
                 Dg(k)=input('Enter valid non-zero non-negative diameter of the gear in m,D=');
            end
            while size(Dg(k))==[0 0]
                disp('Error, you cannot leave the diameter empty');
                Dg(k)=input('Enter valid non-zero non-negative diameter of the gear in m,D=');
            end
            while isnumeric(Dg(k))==0
                disp('Error, invalid input for diameter of the gear');
                Dg(k)=input('Enter valid non-zero non-negative diameter of the gear in m,D=');
            end
            mg(k)=input('please enter the mass of the gear in Kg if it is neglegible enter 0 m=');
            while  mg(k)<0
                disp('Error, mass cannot be negative')
                 mg(k)=input('enter valid non-negative value for the mass of the gear in Kg,m=');
            end
            while size(mg(k))==[0 0]
                disp('Error you cannot leave the mass empty');
                mg(k)=input('Enter valid non-negative value for the mass of the gear in Kg,D=');
            end
            while isnumeric(mg(k))==0
                disp('Error invalid input for diameter of the gear');
                mg(k)=input('Enter valid non-negative value for the mass of the gear in Kg,m=');
            end
            angle4(k)=input('please enter the angle that tangential load makes with x-axis=');
            while size(angle4(k))==[0 0]
                disp('Error you cannot leave the angle empty');
                angle4(k)=input('please enter the angle that tangential load makes with x-axis=');
            end
            while isnumeric(angle4(k))==0
                disp('Error invalid input for angle');
                angle4(k)=input('please enter the angle that tangential load makes with x-axis=');
            end
            wg(k)=mg(k)*9.81;   
            Ft(k)=(((2*T(k))/Dg(k)));
            fprintf('The torque transmitted by the gear mechanism is %dNm \n',T(k));
            angle3(k)=input('please enter the pressure angle of the gear if no enter 0=');
            while size(angle3(k))==[0 0]
                disp('Error you cannot leave the pressure angle empty');
                angle3(k)=input('please enter the pressure angle of the gear=');
            end
            while isnumeric(angle3(k))==0
                disp('Error invalid input for angle');
                angle3(k)=input('please enter the pressure angle of the gear=');
            end
            Fr(k)=Ft(k)*tand(angle3(k));
            Fh(k)=(((Ft(k)*cosd(angle4(k))+(Fr(k)*sind(angle4(k))))));
            Fv(k)=(((Ft(k)*sind(angle4(k))+(Fr(k)*cosd(angle4(k))))))-wg(k);
            fprintf('The vertical force acting in the shat by the gear mechanism is Fv=%dN \n',Fv(k));
            fprintf('The horizontal force acting on the shaft by the gear mechanism is Fh=%dN\n',Fh(k));
        case 3
           fprintf('-------------------------calculating loads at the shaft due to the chain mechanism mounted at x=%dm-------------------------\n',x(k))
           ps(k)=input('please enter the power transmitted by the sprocket in watt,p=');
             while ps(k)<=0
                disp('Error invalid power ')
                ps(k)=input('Enter valid non-zero non-negative power transmitted by the sprocket in watt,p=');
             end
            while size(ps(k))==[0 0]
                disp('Error you cannot leave the power empty');
                ps(k)=input('Enter valid non-zero non-negative power transmitted by the sprocket in watt,p=');
            end
            while isnumeric(ps(k))==0
                disp('Error invalid input for power transmitted by the sprocket');
                ps(k)=input('Enter valid non-zero non-negative power transmitted by the sprocket in watt,p=');
            end
            T(k)=(ps(k)*60)/(2*pi*n);
            Ds(k)=input('please enter the diameter of the sprocket in meter,D=');
             while  Ds(k)<=0
                disp('Error invalid dimension for the diameter of the sprocket')
                 Ds(k)=input('Enter, valid non-zero non-negative diameter of the sprocket in m,D=');
             end
             while size(Ds(k))==[0 0]
                 disp('Error, you cannot leave the diameter empty');
                 Ds(k)=input('Enter valid non-zero non-negative diameter of the sprocket in m,D=');
             end
             while isnumeric(Ds(k))==0
                 disp('Error invalid input for diameter');
                 Ds(k)=input('Enter valid non-zero non-negative diameter of the sprocket in m,D=');
             end
            ms(k)=input('please enter the mass of the sprocket in Kg if it is neglegible enter 0 m=');
            while  ms(k)<0
                disp('Error mass cannot be negative')
                 ms(k)=input('Enter valid non-negative value for the mass of the sprocket in Kg,m=');
            end
             while size(ms(k))==[0 0]
                 disp('Error you cannot leave the mass empty');
                 ms(k)=input('Enter valid non-negative value for the mass of the sprocket in Kg,m=');
             end
             while isnumeric(ms(k))==0
                 disp('Error invalid input for diameter of the sprocket');
                 ms(k)=input('enter valid non-negative value for the mass of the sprocket in Kg,m=');
             end
            ws(k)=ms(k)*9.81;
            Fc(k)=(2*T(k))/Ds(k);
            angle4(k)=input('please enter the angle of the tension side of the chain wrt posetive x-axis in degree,angle=');
            Fch(k)=Fc(k)*cosd(angle4(k));
            Fcv(k)=(Fc(k)*sind(angle4(k)))- ws(k);
            if (Fch(k)>0)
                Fh(k)=Fch(k);
                fprintf('the horizontal load applied on the shaft by this chain mechanism is %dN in the positive x- direction \n',Fch(k));
            elseif(Fch(k)<0)
                absFch(k)=Fch(k)*-1;
                Fh(k)=Fch(k);
                fprintf('The horizontal load applied on the shaft by this chain mechanism is %dN in the negative x-direction\n',absFch(k));
            else Fh(k)=0;
                fprintf('The horizontal load applied on the shaft by this chain mechanism is %dN\n',Fh(k));
            end
            if (Fcv(k)>0)
                Fv(k)=Fcv(k);
                fprintf('The vertical load applied on the shaft by this chain mechanism is %dN in the upward direction \n',Fcv(k));
            elseif(Fcv(k)<0)
                Fv(k)=Fcv(k);
                absFcv(k)=Fcv(k)*-1;
                fprintf('The vertical load applied on the shaft by this chain mechanism is %dN in the downward direction \n',absFcv(k));
            else Fv(k)=0;
                fprintf('The vertical load applied on the shaft by this chain mechanism is %dN\n',Fv(k));
            end
end 
end
end
FH=Fh;
FV=Fv;
switch j
        case 1
            x(2)=0;x(2)=0;Fh(3)=0;x(3)=0;Fh(4)=0;x(4)=0;
        case 2
            Fh(3)=0;x(3)=0;Fh(4)=0;x(4)=0;
        case 3
            Fh(4)=0;x(4)=0;
    end
    a=input('please enter the location of the first bearing in the shaft in m,a=');
    while size(a)==[0 0]
        disp('Error, you cannot leave it empty');
        a=input('Enter valid non-negative value for the location of the first bearing in m,a=');
    end
    while isnumeric(a)==0
        disp('Error invalid input for diameter of the sprocket');
        a=input('Enter valid non-negative value for the location of the first bearing in m,a=');
    end
    while a<0
        disp('Error position cannot be negative');
        a=input('please enter non-negative value for the position of the first bearing in the shaft in m,a=');
    end
    b=input('please enter the location of the second bearing in the shaft in m,b=');
    while b<0
        disp('error position cannot be negative');
        b=input('please enter non-negative value for the position of the second bearing in the shaft in m,b=');   
    end
    while size(b)==[0 0]
        disp('Error, you cannot leave it empty');
        b=input('Enter valid non-negative value for the location of the second bearing in m,b=');
    end
    while isnumeric(b)==0
        disp('Error invalid input for diameter of the sprocket');
        b=input('Enter valid non-negative value for the location of the second bearing in m,b=');
    end
    R2h=(((Fh(1)*(a-(x(1))))+(Fh(2)*(a-(x(2))))+(Fh(3)*(a-(x(3))))+(Fh(4)*(a-(x(4)))))/(a-b));
    R1h=Fh(1)+Fh(2)+Fh(3)+Fh(4)-R2h;
    fprintf('The reaction at the first bearing in the horizontal direction is R1=%dN\n',R1h);
    fprintf('The reaction at the second bearing in the horizontal direction is R2=%dN\n',R2h);
  switch j
        case 1
            x(2)=0;x(2)=0;Fv(3)=0;x(3)=0;Fv(4)=0;x(4)=0;
        case 2
            Fv(3)=0;x(3)=0;Fv(4)=0;x(4)=0;
        case 3
            Fv(4)=0;x(4)=0;
  end
    R2v=-(((Fv(1)*(a-(x(1))))+(Fv(2)*(a-(x(2))))+(Fv(3)*(a-(x(3))))+(Fv(4)*(a-(x(4)))))/(a-b));
    R1v=-Fv(1)-Fv(2)-Fv(3)-Fv(4)-R2v;
    fprintf('The reaction at the first bearing in the vertical direction is R1=%dN\n',R1v);
    fprintf('The reaction at the second bearing in the vertical direction  is R2=%dN\n',R2v);  
  Q=input('please enter the length of the shaft in m L=');
while Q<=0
    disp('error length cannot be zero or negative')
    Q=input('please enter non-zero, non-negative length of the shaft in m, L=');
end
while size(Q)==[0 0]
    disp('Error, you cannot leave it empty');
    Q=input('Enter valid non-negative value for the length of the shaft in m, L=');
end
    while isnumeric(Q)==0
        disp('Error invalid input for the length of the shaft');
        Q=input('Enter valid non-negative value for the length of the shaft in m, L=');
    end
u=linspace(0,Q);
Vh=R1h*(u>a)+R2h*(u>b)+Fh(1)*(u>x(1))-Fh(2)*(u>x(2))-Fh(3)*(u>x(3))-Fh(4)*(u>x(4));
Mh=(R1h*(u-a).*(u>a))+(R2h*(u-b).*(u>b))-(Fh(1)*(u-x(1)).*(u>x(1)))-(Fh(2)*(u-x(2)).*(u>x(2)))-(Fh(3)*(u-x(3)).*(u>x(3)))-(Fh(4)*(u-x(4)).*(u>x(4)));
Vv=R1v*(u>a)+R2v*(u>b)+Fv(1)*(u>x(1))+Fv(2)*(u>x(2))+Fv(3)*(u>x(3))+Fv(4)*(u>x(4));
Mv=(R1v*(u-a).*(u>a))+(R2v*(u-b).*(u>b))+(Fv(1)*(u-x(1)).*(u>x(1)))+(Fv(2)*(u-x(2)).*(u>x(2)))+(Fv(3)*(u-x(3)).*(u>x(3)))+(Fv(4)*(u-x(4)).*(u>x(4)));
M=sqrt(((Mv.^2))+((Mh.^2)));
Z=max(M);
subplot(3,1,1)
area(u,Mv),xlabel('x'),ylabel('Vertical Bending Moment'),title('Vertical Bending Moment Diagram')
set(gca,'YTick',[(min(Mv)):(((max(Mv))-min(Mv))/5):(max(Mv))]);
grid on;
subplot(3,1,2)
area(u,Mh),xlabel('x'),ylabel('Horizontal Bending Moment'),title('Horizontal Bending Moment Diagram')
grid on
set(gca,'YTick',[(min(Mh)):(((max(Mh))-min(Mh))/5):(max(Mh))]);
grid on;
subplot(3,1,3)
area(u,M),xlabel('x'),ylabel('Resultant Bending Moment'),title('Resultant Bending Moment Diagram')
grid on
set(gca,'YTick',[(min(M)):(((max(M))-min(M))/5):(max(M))]);
grid on;
[difference,Mmax_loaction]=min(abs(M-max(M)));
X=u(Mmax_loaction);
fprintf('The maximum resultant bending moment is %dNm located at %dm\n',Z,X);
if X<=x(1)
    T=T(1);
elseif X<=x(2)
    T=T(2);
elseif X<=x(3)
    T=T(3);
else T=T(4);
end
Kb=input('Enter the fatigue and shock factor for bending Kb, enter kb=1 if it is ideal or not given,Kb=');
while Kb<=0
    disp('Error, invalid input for Kb');
    Kb=input('please enter non-zero non-negative Kb');
end
while size(Kb)==[0 0]
        disp('Error, you cannot leave it empty');
        Kb=input('Enter valid non-negative non-zero value for the fatigue and shock factor for bending Kb,Kb=');
end
    while isnumeric(Kb)==0
        disp('Error invalid input for fatigue and shock factor bending Kb');
        Kb=input('Enter valid non-negative non-zero value for the fatigue and shock factor for bending Kb=');
    end
Kt=input('Enter the fatigue and shock factor for bending, enter kt=1 if it is ideal or not given,Kt=');
while Kt<=0
    disp('Error,invalid input for Kt');
    Kt=input('please enter non-zero non-negative Kt');
end
while size(Kt)==[0 0]
        disp('Error, you cannot leave it empty');
        Kt=input('Enter valid non-negative non-zero value for the fatigue and shock factorfor twisting Kt,Kt=');
end
while isnumeric(Kt)==0
    disp('Error invalid input for fatigue and shocke fcator twisting Kt');
    Kt=input('Enter valid non-negative non-zero value for the fatigue and shock factor for twisting Kt=');
end
Te=sqrt((((Kb*Z)^2)+(Kt*T)^2));
Me=((1/2)*((Kb*Z)+Te));
ductile=6;
brittle=7;
Material_Type=input('please enter ductile if the shaft is ductile and enter brittle if the shaft is brittle=');
switch Material_Type
    case 6
        disp('-----------------------------Calculating the diameter of ductile shaft using the Maximum shear stress theory or Guest’s theory--------------------')
fprintf('The equivalent twisting moment is %dNm\n',Te);
t=input('please enter the permissible shear stress of the material used for the shaft in Mpa=');
while t<=0
    disp('Error,invalid input for t');
    t=input('please enter non-zero non-negative permissible stress =');
end
while size(t)==[0 0]
        disp('Error, you cannot leave it empty');
        t=input('Enter valid non-negative non-zero value for the permissible stress =');
end
while isnumeric(t)==0
    disp('Error invalid input for the permissible stress of the shaft');
    t=input('Enter valid non-negative non-zero value for the permissible stress of the shaft=');
end
    case 7
       disp('-----------------------------Calculating the diameter of brittle shaft using the Maximum normal stress theory or Rankine’s theory--------------------') 
       fprintf('The equivalent bending moment is %dNm\n',Me);
       bs=input('please enter the permissible bending stress of the material used for the shaft in Mpa=');
       while bs<=0
           disp('Error,invalid input for t');
           bs=input('please enter non-zero non-negative permissible stress =');
       end
       while size(bs)==[0 0]
           disp('Error, you cannot leave it empty');
           bs=input('Enter valid non-negative non-zero value for the permissible stress =');
       end
       while isnumeric(bs)==0
           disp('Error invalid input for the permissible stress of the shaft');
           bs=input('Enter valid non-negative non-zero value for the permissible stress of the shaft=');
       end
end
solid=4;
hollow=5;
shaft_type=input('please enter solid if the shaft is solid and enter hollow if the shaft is hollow=');% if it is solid enter solid and if it is hollow enter hollow
while shaft_type<=0
    disp('Error,invalid input for the shaft_type');
    shaft_type=input('please enter non-zero non-negative permissible stress =');
end
while size(shaft_type)==[0 0]
        disp('Error, you cannot leave it empty');
        shaft_type=input('please enter solid if the shaft is solid and enter hollow if the shaft is hollow=');
end
while isnumeric(shaft_type)==0
    disp('Error invalid input for the shaft type');
    shaft_type=input('please enter solid if the shaft is solid and enter hollow if the shaft is hollow=');
end
switch shaft_type
    case 4
        if Material_Type==6
            d=(10*((16*Te)/(t*pi))^(1/3));
        elseif Material_Type==7
            d=(10*((16*Me)/(bs*pi))^(1/3));
        end
          disp('-------The diameter of the shaft needed to carry the loads safley is --------')
          fprintf('                              D=%dmm                      \n',d);
    case 5
        q=input('please enter the ratio of the inner diameter to the outer diameter=');
        while q<=0
            disp('Error,invalid input for the ratio of the inner diameter to the outer diameter');
            q=input('please enter non-zero non-negative ratio of the inner diameter to the outer diameter =');
        end
        while size(q)~=[1 1]
            disp('Error, you cannot leave it empty');
            q=input('Enter valid non-negative non-zero value for the ratio of the inner diameter to the outer diameter=');
        end
        while isnumeric(q)==0
            disp('Error invalid input for the ratio of the inner diameter to the outer diameter');
            q=input('Enter valid non-negative non-zero value for the ratio of the inner diameter to the outer diameter=');
        end
        if Material_Type==6
            do=(10*((16*Te)/((t*pi*(1-(q^4)))))^(1/3));
        elseif Material_Type==7
            do=(10*((16*Me)/((bs*pi*(1-(q^4)))))^(1/3));
        end
        di=q*do;
        disp('-------The outer diameter of the hollow shaft needed is --------')
        fprintf('                              Do=%dmm                      \n',do);
        disp('-------The internal diameter of the hollow shaft needed is --------')
        fprintf('                              Di=%dmm                      \n',di);
end
end
