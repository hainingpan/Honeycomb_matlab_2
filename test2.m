function out = test2(n)
ind = randi([1 n*n],300,1);
val = rand(300,1);
[I,J] = ind2sub([n,n],ind);
out = sparse(I,J,val,n,n);
end