%L0325042_RafiNazwanMaulana
%Dekomposisi LU_fudelim(A, b)

function [L,U,b] = DekomposisiLUfudelim(A,b)
[n,l] = size(A);
L=zeros(n);
for i = 1 : n-1,
    [pivot,k] = max(abs(A(i:n, i)));
    if (k ~= 1)
        temp1 = A(i, :);
        A(i,:) = A(i+k-1,:);
        A(i+k-1,:) = temp1;
        temp2 = b(i, :);
        b(i,:) = b(i+k-1,:);
        b(i+k-1,:) = temp2;
        temp3 = L(i, :);
        L(i,:) = L(i+k-1,:);
        L(i+k-1,:) = temp3;
    end
    for h = i+1 : n,
        m = A(h,i)/A(i,i);
        A(h,:) = A(h,:) - m*A(i,:);
        L(h,i) = m;
    end
end
for i=1:n
    L(i,i)=1;
end
U = A;
