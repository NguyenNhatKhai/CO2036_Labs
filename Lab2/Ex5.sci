clf

// Define function xF
n0 = [-1, 0, 1]
x0 = [1, 3, -2]
function msignal = xF(n)
    msignal = 0;
    for i = 1 : length(n0)
        if n == n0(i) then
            msignal = x0(i);
        end
    end
endfunction

// Calculate the odd signal component xoF and even signal component xeF
deff("msignal = xoF(n)", "msignal = 1/2 * (xF(n) - xF(-n))")
deff("msignal = xeF(n)", "msignal = 1/2 * (xF(n) + xF(-n))")

nV = -2 : 2 //nValue

// Draw the signal x(n)
xV = zeros(nV) //xValue
for i = 1 : length(nV)
    xV(i) = xF(nV(i))
end
subplot(3, 1, 1)
plot2d3(nV, xV, style = 2)

// Draw the signal xo(n)
xoV = zeros(nV) //xOddValue
for i = 1 : length(nV)
    xoV(i) = xoF(nV(i))
end
subplot(3, 1, 2)
plot2d3(nV, xoV, style = 3)

// Draw the signal xe(n)
xeV = zeros(nV) //xEvenValue
for i = 1 : length(nV)
    xeV(i) = xeF(nV(i))
end
subplot(3, 1, 3)
plot2d3(nV, xeV, style = 4)
