clc;
clear;
format shortG;
global n;
pulley=1;gear=2;sprocket=3;
disp('......................shaft design ..................................')
n=input('please enter the speed of the shaft in rpm n=');
while n<0
    disp('error this program is developed for rotating shaft')
    n=input('enter valid non-zero non-negative speed of the shaft in rpm n=')
end
while n==0
    disp('error this program is developed for rotating shaft')
    n=input('enter valid non-zero non-negative speed of the shaft in rpm n=')
end
while isnumeric(n)==0
    disp('Error speed cannot be character so please enter a numeric value')
    n=input('enter valid non-zero non-negative speed of the shaft in rpm n=')
end
while size(n)==[0 0]
    disp('Error speed cannot be empty'); 
    n=input('enter valid non-zero non-negative speed of the shaft in rpm n=')
end
disp('please enter you loads and their position in meter on the shaft by calling the function loads_and_theire_postion(varargin)')
disp('example')
disp('         let us say you have pulley at 1m,gear at 10m and sprocket at 20 so you have to enter your loads and theire ')
disp('         position in the following manner ')
disp('                          Loads_with_position([1 pulley],[10 gear],[20 sprocket])')
disp('--------------------please follow the the instructions carefully------------------------------------')