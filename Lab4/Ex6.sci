
function str = signalToString(xn, xorigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Sianal to string error: Out of range xorigin!")
        return
    end
    str = "["
    for i = 1 : length(xn)
        str = str + string(xn(i))
        if i == xorigin then
            str = str + "*"
        end
        if i < length(xn) then
            str = str + " "
        end
    end
    str = str + "]"
endfunction

function [yn, yorigin] = energy(xn, xorigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Energy error: Out of range xorigin!")
        return
    end
    yn = zeros(length(xn))
    for i = 1 : length(xn)
        yn(i) = xn(i) * xn(i)
    end
    yorigin = xorigin
    // disp("Energy start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Energy finish!")
endfunction

function [yn, yorigin] = delay(xn, xorigin, k)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Delay error: Out of range xorigin!")
        return
    end
    if k <= 0 then
        disp("Delay error: Non positive k!")
        return
    end
    if k < xorigin then
        yn = xn
        yorigin = xorigin - k
    else
        yn = [zeros(1, k - xorigin + 1), xn]
        yorigin = 1
    end
    // disp("Delay start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "k = " + string(k) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Delay finish!")
endfunction

function [yn, yorigin] = advance(xn, xorigin, k)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Advance error: Out of range xorigin!")
        return
    end
    if k <= 0 then
        disp("Advance error: Non positive k!")
        return
    end
    if k <= length(xn) - xorigin then
        yn = xn
        yorigin = xorigin + k
    else
        yn = [xn, zeros(1, k - length(xn) + xorigin)]
        yorigin = length(yn)
    end
    // disp("Advance start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "k = " + string(k) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Advance finish!")
endfunction

function [yn, yorigin] = fold(xn, xorigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Fold error: Out of range xorigin!")
        return
    end
    yn = xn($ : -1 : 1)
    yorigin = length(xn) - xorigin + 1
    // disp("Fold start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Fold finish!")
endfunction

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    if x1origin <= 0 || x1origin > length(x1n) then
        disp("Multi error: Out of range x1origin!")
        return
    end
    if x2origin <= 0 || x2origin > length(x2n) then
        disp("Multi error: Out of range x2origin!")
        return
    end
    nmin = min(- x1origin + 1, - x2origin + 1)
    nmax = max(length(x1n) - x1origin, length(x2n) - x2origin)
    x1nextended = [zeros(1, - x1origin + 1 - nmin), x1n, zeros(1, nmax - length(x1n) + x1origin)]
    x2nextended = [zeros(1, - x2origin + 1 - nmin), x2n, zeros(1, nmax - length(x2n) + x2origin)]
    yn = nmin : nmax
    for i = 1 : nmax - nmin + 1
        if yn(i) == 0 then
            yorigin = i
        end
        yn(i) = x1nextended(i) * x2nextended(i)
    end
    // disp("Multi start: " + ascii(10) + ascii(9) + "x1n = " + signalToString(x1n, x1origin) + ascii(10) + ascii(9) + "x2n = " + signalToString(x2n, x2origin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Multi finish!")
endfunction

function [yn, yorigin] = fsconvolution(xn, xorigin, hn, horigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Folding and shifting convolution error: Out of range xorigin!")
        return
    end
    if horigin <= 0 || horigin > length(hn) then
        disp("Folding and shifting convolution error: Out of range horigin!")
        return
    end
    [hfolded, hfoldedorigin] = fold(hn, horigin)
    nmin = (- xorigin + 1) + (- horigin + 1)
    nmax = (length(xn) - xorigin) + (length(hn) - horigin)
    yn = zeros(1, nmax - nmin + 1);
    for i = nmin : nmax
        if i < 0 then
            [hshifted, hshiftedorigin] = advance(hfolded, hfoldedorigin, - i)
        elseif i > 0 then
            [hshifted, hshiftedorigin] = delay(hfolded, hfoldedorigin, i)
        else
            hshifted = hfolded
            hshiftedorigin = hfoldedorigin
            yorigin = i - nmin + 1
        end
        [temp, temporigin] = multi(xn, xorigin, hshifted, hshiftedorigin)
        yn(i - nmin + 1) = sum(temp)
    end
    disp("Folding and shifting convolution start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "hn = " + signalToString(hn, horigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Folding and shifting convolution finish!")
endfunction

function [yn, yorigin] = mconvolution(xn, xorigin, hn, horigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Matrix convolution error: Out of range xorigin!")
        return
    end
    if horigin <= 0 || horigin > length(hn) then
        disp("Matrix convolution error: Out of range horigin!")
        return
    end
    mmatrix = xn' * hn
    [rows, columns] = size(mmatrix);
    yn = zeros(1, rows + columns - 1);
    for i = 1 : rows
        for j = 1 : columns
            yn(i + j - 1) = yn(i + j - 1) + mmatrix(i, j)
        end
    end
    yorigin = xorigin + horigin - 1
    disp("Matrix convolution start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "hn = " + signalToString(hn, horigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Matrix convolution finish!")
endfunction

function drawconvolution(xn, xorigin, hn, horigin, yn, yorigin)
    clf
    [en, eorigin] = energy(yn, yorigin)
    nmindisplay = min(- xorigin + 1, - yorigin + 1, - eorigin + 1)
    nmaxdisplay = max(length(xn) - xorigin, length(yn) - yorigin, length(en) - eorigin)
    xndisplay = [zeros(1, - xorigin + 1 - nmindisplay), xn, zeros(1, nmaxdisplay - length(xn) + xorigin)]
    yndisplay = [zeros(1, - yorigin + 1 - nmindisplay), yn, zeros(1, nmaxdisplay - length(yn) + yorigin)]
    endisplay = [zeros(1, - eorigin + 1 - nmindisplay), en, zeros(1, nmaxdisplay - length(en) + eorigin)]
    n = nmindisplay : nmaxdisplay
    plot2d3(n, xndisplay, 1)
    plot2d3(n, yndisplay, 2)
    plot2d3(n, endisplay, 3)
endfunction

