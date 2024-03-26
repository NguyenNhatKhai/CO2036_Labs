clf

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    if x1origin <= 0 || x1origin > length(x1n) then
        disp("ERROR: x1origin")
        return
    end
    if x2origin <= 0 || x2origin > length(x2n) then
        disp("ERROR: x2origin")
        return
    end
    nmin = min(- x1origin + 1, - x2origin + 1)
    nmax = max(length(x1n) - x1origin, length(x2n) - x2origin)
    x1ndisplay = [zeros(1, - x1origin + 1 - nmin), x1n, zeros(1, nmax - length(x1n) + x1origin)]
    x2ndisplay = [zeros(1, - x2origin + 1 - nmin), x2n, zeros(1, nmax - length(x2n) + x2origin)]
    yn = nmin : nmax
    for i = 1 : nmax - nmin + 1
        if yn(i) == 0 then
            yorigin = i
        end
        yn(i) = x1ndisplay(i) * x2ndisplay(i)
    end
    // Magic figure
    n = nmin : nmax
    plot2d3(n, x1ndisplay, 1)
    plot2d3(n, x2ndisplay, 2)
    plot2d3(n, yn, 3)
endfunction
