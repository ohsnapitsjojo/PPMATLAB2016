function f = fak(n)

f = n;

if n <= 1
   f = 1; 
end

if n > 1
    while n >1
       f = f*(n-1);
       n = n-1;
    end
end

