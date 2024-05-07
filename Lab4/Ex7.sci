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
    disp("Energy start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Energy finish!")
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
    disp("Delay start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "k = " + string(k) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Delay finish!")
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
    disp("Advance start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "k = " + string(k) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Advance finish!")
endfunction

function [yn, yorigin] = fold(xn, xorigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Fold error: Out of range xorigin!")
        return
    end
    yn = xn($ : -1 : 1)
    yorigin = length(xn) - xorigin + 1
    disp("Fold start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Fold finish!")
endfunction

function [yn, yorigin] = cmulti(xcn, xcorigin, xln, xlorigin) // xc: x-circular, xl: x-linear
    if xcorigin <= 0 || xcorigin > length(xcn) then
        disp("Circular multi error: Out of range xcorigin!")
        return
    end
    if xlorigin <= 0 || xlorigin > length(xln) then
        disp("Circular multi error: Out of range xlorigin!")
        return
    end
    yn = zeros(1, length(xln))
    yorigin = xlorigin
    for i = 1 : length(yn)
        temp1 = modulo(xcorigin + i - xlorigin, length(xcn))
        if temp1 <= 0 then
            temp1 = temp1 + length(xcn)
        end
        yn(i) = xln(i) * xcn(temp1)
    end
    disp("Circular multi start: " + ascii(10) + ascii(9) + "xcn = " + signalToString(xcn, xcorigin) + ascii(10) + ascii(9) + "xln = " + signalToString(xln, xlorigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Circular multi finish!")
endfunction

function [yn, yorigin] = cfsconvolution(xn, xorigin, hn, horigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Circular folding and shifting convolution error: Out of range xorigin!")
        return
    end
    if horigin <= 0 || horigin > length(hn) then
        disp("Circular folding and shifting convolution error: Out of range horigin!")
        return
    end
    [hfolded, hfoldedorigin] = fold(hn, horigin)
    yn = zeros(1, length(hn))
    yorigin = horigin
    for i = 1 : length(yn)
        if i < 0 then
            [hshifted, hshiftedorigin] = advance(hfolded, hfoldedorigin, - i)
        elseif i > 0 then
            [hshifted, hshiftedorigin] = delay(hfolded, hfoldedorigin, i)
        else
            hshifted = hfolded
            hshiftedorigin = hfoldedorigin
        end
        [temp, temporigin] = cmulti(xn, xorigin, hshifted, hshiftedorigin)
        yn(i) = sum(temp)
    end
    drawcconvolution(xn, xorigin, hn, horigin, yn, yorigin)
    disp("Circular folding and shifting convolution start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "hn = " + signalToString(hn, horigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Circular folding and shifting convolution finish!")
endfunction

function [yn, yorigin] = cmconvolution(xn, xorigin, hn, horigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("Circular matrix convolution error: Out of range xorigin!")
        return
    end
    if horigin <= 0 || horigin > length(hn) then
        disp("Circular matrix convolution error: Out of range horigin!")
        return
    end
    matrixxn = zeros(length(xn), length(xn))
    for i = 1 : length(xn)
        for j = 1 : length(xn)
            temp1 = modulo(j + i - 1, length(xn))
            if temp1 <= 0 then
                temp1 = temp1 + length(xn)
            end
            matrixxn(temp1, i) = xn(j)
        end
    end
    yn = (matrixxn * hn')'
    yorigin = horigin
    drawcconvolution(xn, xorigin, hn, horigin, yn, yorigin)
    disp("Circular matrix convolution start: " + ascii(10) + ascii(9) + "xn = " + signalToString(xn, xorigin) + ascii(10) + ascii(9) + "hn = " + signalToString(hn, horigin) + ascii(10) + ascii(9) + "yn = " + signalToString(yn, yorigin) + ascii(10) + "  Circular matrix convolution finish!")
endfunction

function drawcconvolution(xn, xorigin, hn, horigin, yn, yorigin)
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

