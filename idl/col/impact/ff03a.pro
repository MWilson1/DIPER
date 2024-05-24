pro ff03a,vi0,vk0,x,n
;+
;   ff03a,vi0,vk0,x,n
;
;            bessel functions i0(x),k0(x)
;
;-
z = abs(x)
u = .125d0*z
if(u le 1.0) then goto,label1 else goto,label2
label1:
y=u*u
;     i0(x)  x=0.0-8.0
v=((((((((((((((.1107591535e-5*y+.77845382981e-5)*y+.11997336192421e-3)*y+ $
.1221094385333e-2)*y+.110468979270825e-1)*y+.0834931400288711)*y+ $
.5218621382026199)*y+2.641913870905451)*y+10.56765964238841)*y+ $
32.36345673148189)*y+72.81777778618472)*y+113.7777777769873)*y+ $
113.7777777778227)*y+63.99999999999862)*y+16.0)*y+1.0
if(n ne 0) then goto,label3 else goto,label4
;     k0(x)  x=0.0-8.0  depends on i0(x)
label3:
w=((((((((((((((.15341193685e-5*y+.97748798302e-5)*y+.1468125296774e-3)*y+ $
.0013899759983002)*y+.0116718491868227)*y+.0806070379172961)*y+ $
.4516512741275782)*y+1.992919444929645)*y+6.65072635719975)*y+ $
15.74449716708661)*y+23.28882253212214)*y+13.63322963079218)*y- $
14.81121481244677)*y-29.66464166537305)*y-15.41616041634275)*y- $
1.963510026021426-alog(u)*v
vk0=w
label4:
vi0=v
label5:
return
label2:
k=1
w = 1.0d0/sqrt(z)
y = 1.0d0/u
if(n ne 1) then goto,label6 else goto,label8
label6:
v=((((((((((((((((((((((((16777216.*y+16777216.)*y-104857600.)*y- $
109051904.)*y+276824064.)*y+304611328.)*y-395051008.)*y-470024192.)*y+ $
324927488.)*y+429162496.)*y-159072256.)*y-238264320.)*y+52506624.)*y+ $
87236608.)*y-8832000.)*y-15662592.)*y+9133824.)*y+17349504.)*y+32634048.)*y+ $
86866944.)*y+276516992.)*y+1092351608.)*y+5706914364.)*y*1.0e-14+ $
.43829107728e-3)*y+.62334731313498e-2)*y+.39894228040142
if(k eq 1) then goto,label7 else goto,label9
label7:
vi0 = v*exp(z)*w
label8:
k=k+1
y=-y
if(n eq 0) then goto,label5 else goto,label6
label9:
vk0=v*exp(-z)*w *3.141592653589d0
goto,label5
end

