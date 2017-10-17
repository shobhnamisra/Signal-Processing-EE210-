function [B] = filter_3(A, h) %function for filtering 
C = zeros(size(A, 1) + size(h, 1) - 1 , size(A, 2) + size(h, 2) - 1); %Creating a temporary matrix to carry out the convolution
for i = 1 : size(A, 1)%loops for filling A into the central part of C
    for j = 1 : size(A, 2)
        C(i + 1, j + 1) = A(i, j);
    end
end
B = zeros(size(A, 1), size(A, 2)); %loops for doing the convolution 
for x = 1 : size(A, 1)
    for y = 1 : size(A, 2)
        for i = 1 : size(h, 1)
            for j = 1 : size(h, 2)
                B(x, y) = B(x, y) + (C(x + i - 1, y + j - 1)*h(i, j));
            end
        end
    end
end
%returns the filtered image matrix

