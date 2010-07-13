axis off
hold on

text(-4,0.2,'w   +w   =0','fontname','symbol','fontweight','bold','fontsize',15)
text(-3.5,0.2,'x      y','fontsize',15)
text(-4,0,'   1         2','fontsize',10)

text(-6,2.2,'w   +w   =2p','fontname','symbol','fontweight','bold','fontsize',15)
text(-5.5,2.2,'x      y','fontsize',15)
text(-6,2.0,'   1         2','fontsize',10)

for i=1:4
  s=2*(i-1)
  q=[0-s 8-s];
  r=[0+s 1+s];
  line(q,r,'linewidth',1.5)
end

for i=1:3
  s=1+2*(i-1)
  q=[0-s 8-s];
  r=[0+s 1+s];
  line(q,r,'linestyle','--')
end


hold off





