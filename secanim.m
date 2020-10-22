clc

D=2.5;
d=0.5;
C=0.3; % constante para manter a mola em deformacao elastica(C > 0.1)
num=10; % numero de molas(espiras)

for i =1:length(tout)
    
    w = (0.25/num)*(D-2*d+x(i)); % projeção horiz. mola
    H = C*0.25*(D-2*d+max(x)); % comprimento mola
    h = sqrt(H^2-w^2); % proj. vertical mola
   
    % plotando trecho que liga bolinha a mola
    plot([x(i),x(i)-d],[0,0],'k','LineWidth',2); hold all; % hold all segura todas as imagens ate um comando hold off
    
    % loop para plotar as m espiras juntas
    for n=1:num
        
        plot([x(i)-d-4*w*(n-1),x(i)-d-w-4*w*(n-1)],[0,-h],'k',... % primeiro trecho mola
             [x(i)-d-w-4*w*(n-1),x(i)-d-3*w-4*w*(n-1)],[-h,h],'k',... % segundo trecho mola
             [x(i)-d-3*w-4*w*(n-1),x(i)-d-4*w-4*w*(n-1)],[h,0],'k',... % terceiro trecho mola
             'LineWidth',2);
     
    end
    
    plot([-D+d,-D],[0,0],'k','LineWidth',2); %plotando trecho mola final    
    plot(x(i),0,'ro','MarkerSize',40,'MarkerFaceColor','r'); % plotando particula
    hold off;
    axis([-D,max(x),-2,2]);
    xlabel('Position x (m)'); 
    ylabel('Position y (m)');
    
    %gerando frame do video
    mov(i) = getframe(gcf);
end