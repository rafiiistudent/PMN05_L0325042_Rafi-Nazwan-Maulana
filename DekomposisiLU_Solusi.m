%L0325042_RafiNazwanMaulana
%Dekomposisi LU_Solusi

function x = DekomposisiLU_Solusi (A,b)
tic;
fprintf('Hasil dekomposisi LU\n')
[L,U,b] = DekomposisiLUfudelim(A,b)
[n,n] = size(L);
x = zeros(n,1);
z = zeros(n,1);
z(1) = b(1)/L(1,1);
for i = 2:n,
    z(i) = (b(i) - L(i, 1:i-1)*z(1:i-1)) / L(i,i);
end
x(n) = z(n)/U(n,n);
for i = n-1:-1:1,
    x(i) = (z(i) - U(i, i+1:n)*x(i+1:n)) / U(i,i);
end
toc;
