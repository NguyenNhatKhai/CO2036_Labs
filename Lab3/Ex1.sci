clf

function [yn, yorigin] = delay(xn, xorigin, k)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("ERROR: xorigin")
        return
    end
    if k <= 0 then
        disp("ERROR: k")
        return
    end
    if k < xorigin then
        yn = xn
        yorigin = xorigin - k
    else
        yn = [zeros(1, k - xorigin + 1), xn]
        yorigin = 1
    end
    // Magic figure
    nmin = min(- xorigin + 1, - yorigin + 1) - 1
    nmax = max(length(xn) - xorigin, length(yn) - yorigin) + 1
    xndisplay = [zeros(1, - xorigin + 1 - nmin), xn, zeros(1, nmax - length(xn) + xorigin)]
    yndisplay = [zeros(1, - yorigin + 1 - nmin), yn, zeros(1, nmax - length(yn) + yorigin)]
    n = nmin : nmax
    plot2d3(n, xndisplay, 1)
    plot2d3(n, yndisplay, 2)
endfunction
