clf

// Define function xF
n0 = [-2, -1, 0, 1]
x0 = [1, -2, 3, 6]
function msignal = xF(n)
    msignal = 0;
    for i = 1 : length(n0)
        if n == n0(i) then
            msignal = x0(i);
        end
    end
endfunction

// QUESTION A

// Calculate the signal y1(n) = x(-n)
deff("msignal = y1F(n)", "msignal = xF(- n)")

n1V = -3 : 3 //nValue

// Draw the signal x(n)
x1V = zeros(n1V) //xValue
for i = 1 : length(n1V)
    x1V(i) = xF(n1V(i))
end
subplot(2, 1, 1)
plot2d3(n1V, x1V, style = 2)

// Draw the signal y1(n)
y1V = zeros(n1V) //yValue
for i = 1 : length(n1V)
    y1V(i) = y1F(n1V(i))
end
subplot(2, 1, 2)
plot2d3(n1V, y1V, style = 3)

// QUESTION B

scf

// Calculate the signal y1(n) = x(n + 3)
deff("msignal = y2F(n)", "msignal = xF(n + 3)")

n2V = -6 : 2 //nValue

// Draw the signal x(n)
x2V = zeros(n2V) //xValue
for i = 1 : length(n2V)
    x2V(i) = xF(n2V(i))
end
subplot(2, 1, 1)
plot2d3(n2V, x2V, style = 2)

// Draw the signal y2(n)
y2V = zeros(n2V) //yValue
for i = 1 : length(n2V)
    y2V(i) = y2F(n2V(i))
end
subplot(2, 1, 2)
plot2d3(n2V, y2V, style = 3)

// QUESTION C

scf

// Calculate the signal y1(n) = 2x(-n-2)
deff("msignal = y3F(n)", "msignal = 2 * xF(- n - 2)")

n3V = -4 : 2 //nValue

// Draw the signal x(n)
x3V = zeros(n3V) //xValue
for i = 1 : length(n3V)
    x3V(i) = xF(n3V(i))
end
subplot(2, 1, 1)
plot2d3(n3V, x3V, style = 2)

// Draw the signal y3(n)
y3V = zeros(n3V) //yValue
for i = 1 : length(n3V)
    y3V(i) = y3F(n3V(i))
end
subplot(2, 1, 2)
plot2d3(n3V, y3V, style = 3)
