clf

exec("C:\HCMUT\HK232\CO2036\Lab3\Ex1.sci");
exec("C:\HCMUT\HK232\CO2036\Lab3\Ex2.sci");
exec("C:\HCMUT\HK232\CO2036\Lab3\Ex3.sci");
exec("C:\HCMUT\HK232\CO2036\Lab3\Ex4.sci");
exec("C:\HCMUT\HK232\CO2036\Lab3\Ex5.sci");

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    if xorigin <= 0 || xorigin > length(xn) then
        disp("ERROR: xorigin")
        return
    end
    if horigin <= 0 || horigin > length(hn) then
        disp("ERROR: horigin")
        return
    end
    [hfolded, hfoldedorigin] = fold(hn, horigin);
    nmin = (- xorigin + 1) + (- horigin + 1)
    nmax = (length(xn) - xorigin) + (length(hn) - horigin)
    for i = nmin : nmax
        if i < 0 then
            [hshifted, hshiftedorigin] = advance(hfolded, hfoldedorigin, - i);
        elseif i > 0 then
            [hshifted, hshiftedorigin] = delay(hfolded, hfoldedorigin, i);
        else
            hshifted = hfolded
            hshiftedorigin = hfoldedorigin
            yorigin = i - nmin + 1
        end
        [temp, temporigin] = multi(xn, xorigin, hshifted, hshiftedorigin);
        yn(i - nmin + 1) = sum(temp)
    end
    yn = yn'
endfunction
