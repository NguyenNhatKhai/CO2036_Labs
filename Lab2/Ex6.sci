clf

// Define function x1
n1 = [0, 1, 2, 3]
x1 = [0, 1, 3, -2]
function msignal = x1F(n)
    msignal = 0;
    for i = 1 : length(n1)
        if n == n1(i) then
            msignal = x1(i);
        end
    end
endfunction

// Define function x2
n2 = [-1, 0, 1, 2]
x2 = [0, 1, 2, 3]
function msignal = x2F(n)
    msignal = 0;
    for i = 1 : length(n2)
        if n == n2(i) then
            msignal = x2(i);
        end
    end
endfunction

// Calculate the signal y(n) = x1(n) + x2(n)
deff("msignal = yF(n)", "msignal = x1F(n) + x2F(n)")

nV = -2 : 4 //nValue

// Draw the signal x1(n)
x1V = zeros(nV) //x1Value
for i = 1 : length(nV)
    x1V(i) = x1F(nV(i))
end
subplot(3, 1, 1)
plot2d3(nV, x1V, style = 2)

// Draw the signal x2(n)
x2V = zeros(nV) //x2Value
for i = 1 : length(nV)
    x2V(i) = x2F(nV(i))
end
subplot(3, 1, 2)
plot2d3(nV, x2V, style = 3)

// Draw the signal y(n)
yV = zeros(nV) //yValue
for i = 1 : length(nV)
    yV(i) = yF(nV(i))
end
subplot(3, 1, 3)
plot2d3(nV, yV, style = 4)
