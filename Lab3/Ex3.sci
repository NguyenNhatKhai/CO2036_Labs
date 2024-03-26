clf

function [yn, yorigin] = fold(xn, xorigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("ERROR: xorigin")
        return
    end
    yn = xn($ : -1 : 1)
    yorigin = length(xn) - xorigin + 1
    // Magic figure
    nmin = min(- xorigin + 1, - yorigin + 1) - 1
    nmax = max(length(xn) - xorigin, length(yn) - yorigin) + 1
    xndisplay = [zeros(1, - xorigin + 1 - nmin), xn, zeros(1, nmax - length(xn) + xorigin)]
    yndisplay = [zeros(1, - yorigin + 1 - nmin), yn, zeros(1, nmax - length(yn) + yorigin)]
    n = nmin : nmax
    plot2d3(n, xndisplay, 1)
    plot2d3(n, yndisplay, 3)
endfunction

