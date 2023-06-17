%%please note that input must be in the form 
%%%f (X) = c1x1 + c2x2 + · · · + cnxn     (1)
%%% Subject Ax <= b    



clear;clc
A=[1 1;-6 -4];
b=[8 -12];
lb=[0,0];
f=[2 4];
Aeq=[1 4];
beq=[20];
disp("################Matlab Linprog result##################")
ma=tic;
[q,r]=linprog(f,A,b,Aeq,beq,lb);
disp( q);
disp("Optimal solutin found = "+r);
mattime=toc(ma);
disp("collapsed time for matlab = "+mattime)
myalgo=tic;
disp("################ my Revised simplex##################")
[X,values,Fmin]=revised_simplex(f,A,b,Aeq,beq);
disp("Optimal solutin found = "+Fmin);
disp("X values ")
disp(values)
disp("x corresponding index (X corresponding to not displayed indecies=0) : ")
disp(X)
minetime=toc(myalgo);
disp("collapsed time for my revised simplex = "+minetime)

%% No feasible solution question
f=[-3 -2];
A=[9 10 ;-21 4; 1 2;6 -1 ;-3 -1];
b=[330 36 6 72 -54];
Aeq=[];
beq=[];
lb=[0,0];
disp("################Matlab Linprog result##################")
[q,r]=linprog(f,A,b,Aeq,beq,lb);
%disp("X values "+q);
%disp("Optimal solutin found = "+r);
mattime=toc(ma);
disp("collapsed time for matlab = "+mattime)
myalgo=tic;
disp("################ my Revised simplex##################")
[X,values,Fmin]=revised_simplex(f,A,b,Aeq,beq);
disp("Optimal solutin found = "+Fmin);
disp("X values ")
disp(values)
disp("x corresponding index (X corresponding to not displayed indecies=0) : ")
disp(X)
minetime=toc(myalgo);
disp("collapsed time for my revised simplex = "+minetime)
%% 
A = [1 1
    1 1/4
    1 -1
    -1/4 -1
    -1 -1
    -1 1];

b = [2 1 2 1 -1 2];

f = [-1 -1/3];
Aeq = [1 1/4];
beq = 1/2;
lb=[0,0];





ma=tic;
disp("################Matlab Linprog result##################")
[q,r]=linprog(f,A,b,Aeq,beq,lb);
disp(q)
disp(r)
mattime=toc(ma);
disp("collapsed time "+mattime)
myalgo=tic;
disp("################ my Revised simplex##################")
[X,values,Fmin]=revised_simplex(f,A,b,Aeq,beq);
disp("Optimal solutin found = "+Fmin);
disp("X values ")
disp(values)
disp("x corresponding index (X corresponding to not displayed indecies=0) : ")
disp(X)
minetime=toc(myalgo);
disp("collapsed time "+minetime)


