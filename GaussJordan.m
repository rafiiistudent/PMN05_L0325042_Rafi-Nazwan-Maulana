%L0325042_RafiNazwanMaulana
%Eliminasi Gauss Jordan

function x = GaussJordan(A,b)
tic
[n,l] = size(A);
for i = 1 : n-1,
    [pivot,k] = max(abs(A(i:n, i)))
    if (k ~= 1)
        temp1 = A(i, :);
        temp2 = b(i, :);
        A(i,:) = A(i+k-1,:);
        b(i,:) = b(i+k-1,:);
        A(i+k-1,:) = temp1;
        b(i+k-1,:) = temp2;
    end
    for (h = i+1 : n),
        m = A(h,i)/A(i,i);
        A(h,:) = A(h,:) - m*A(i,:);
        b(h,:) = b(h,:) - m*b(i,:);
    end
end
fprintf('Hasil forward elimination:\n')
A
for i = n:-1:2
    for h = i-1:-1:1
        m = A(h,i)/A(i,i);
        A(h,:) = A(h,:)-m*A(i,:);
        b(h,:) = b(h,:)-m*b(i,:);
    end
end
for i = 1:n
    b(i,:) = b(i,:) / A(i,i);
    A(i,:) = A(i,:) / A(i,i);
end
fprintf('Hasil backwards elimination:\n')
A
x = b;
toc
