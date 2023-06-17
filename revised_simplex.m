function [X_indecies,X_values,Fmin]=revised_simplex(f,A,b,Aeq,beq)

%%%check for >= constraints 
l=length(f);
greater=find(b<0);
u1=size(A);
u2=size(Aeq);
if (u1(2)==u2(2))&&(u2(2)==length(f))
    disp("check the dimension of your input please")
    X_indecies=nan;
    X_values=nan;
    Fmin=nan;
    return
end


if ~isempty(greater)
    
    for co=length(greater):-1:1
        
        temp=A(greater(co),:);
        tempp=b(greater(co));
        A(greater(co),:)=[];
        b(greater(co))=[];
        
        A(:,end+1)=0;
        Aeq(end+1,:)=-temp;
        beq(end+1)=-tempp;
        
        Aeq(:,end+1)=0;
        Aeq(end,end)=-1;

    end
    



end

% A is the non basic set 
n=length(f);
sa=size(A);
m=sa(1);
sa2=size(Aeq);
meq=sa2(1);
basic_varlist=zeros(1,m+meq);
degenrate=0;
phase1=0;
phase2=0;

%%checking the input
if  1
    flag=1;
    A=[A; Aeq];
    if meq==0
    b=[b beq 0];
    canform=[eye(m+1,m+1) b'];
    va=1;
    phase1=1;
    I=eye(m+1,m+1);
    A(end+1,:)=[f];
    A=[A [eye(meq+m,meq+m);zeros(1,m+meq)]];
    else
       b=[b beq  -1*sum(beq) 0];
       mt=m+meq;
       canform=[eye(mt+2,mt+2) b'];
      va=2;
      
      w=-1*sum(Aeq,1);
      A(end+1,:)=w;
      A(end+1,:)=[f  zeros(1,length(greater))];
      I=eye(mt+2,mt+2);
      A=[A [eye(meq+m,meq+m);zeros(2,m+meq)]];
      phase2=1;
    end
    
    %%%iterate
    i=0;
    while phase2 
    i=i+1;
    c=canform(end,1:end-1)*A(1:end,:);
    d=canform(end-1,1:end-1)*A(1:end,:);
    [v,minindex]=min(d);
    minindex=minindex(1);
   
    if v<0
    B=canform(1:mt,1:mt);
    
    enteringvar=B*A(1:end-va,minindex);
   
    ratio=canform(1:mt,end)./enteringvar;
    if degenrate==1
        ratio(ratio<=0)=nan;
    else
        ratio(ratio<0)=nan;
    end
    [minm,minratio]=min(ratio);
    if minm==0
        degenrate=degenrate+1;
    else
        degenrate=0;
    end
   
    minratio=minratio(1);
    %pivot reduction 
    pivot_row =minratio;
    

    I2=I;
    I2(:,pivot_row)=[enteringvar ; v;c(minindex)];
     Leaving_var=canform(minratio,1:end-1);
    canformtemp=[I2 canform];
    canform=rref(canformtemp);
    canform=canform(:,mt+3:end);
    basic_varlist(minratio)=minindex;
    if  round(canform(end-1,end),2)==0.00
       
        phase2=0;
        phase1=1;
      
        A=[A(:,1:end-sa2(1))];
        A(end-1,:)=[];
        canform(end-1,:)=[];
        canform(:,end-2)=[];
        


    end
   
  
    elseif canform(end-1,end)~=0
        
       disp("no feasible solution found")
        Fmin=nan;
        X_indecies=nan;
        X_values=nan;
        flag=0;

       break



    end
    end   
    degenrate=0;
    while flag && phase1 
       
   
    [r,~]=size(canform);
    m=r-1;
    I=eye(m+1,m+1);
    c=canform(end,1:end-1)*A(1:end,:);
   
    
    [v,minindex]=min(c);
    minindex=minindex(1);
    if v<0
    B=canform(1:m,1:m);
    enteringvar=B*A(1:end-1,minindex);
    ratio=canform(1:m,end)./enteringvar;
    if degenrate==1
        ratio(ratio<=0)=nan;
    else
        ratio(ratio<0)=nan;
    end
    [minm,minratio]=min(ratio);
    if minm==0
        degenrate=degenrate+1;
    else
        degenrate=0;
    end
    
    
    minratio=minratio(1);
    pivot_row =minratio;
    

    I2=I;
    I2(:,pivot_row)=[enteringvar ; v];

    canformtemp=[I2 canform];
    canform=rref(canformtemp);
     
    canform=canform(:,m+2:end);
   

   
   
    basic_varlist(minratio)=minindex;
    else
        Fmin=-1*canform(end,end);
        X_indecies=basic_varlist;
        X_indecies(X_indecies>l)=0;
  
        in=find(X_indecies~=0);
        X_indecies=X_indecies(X_indecies~=0);
        X_values=canform(:,end);
        X_values=X_values(in);
       
        flag=0;

    end

    end

    


    end
    

end

