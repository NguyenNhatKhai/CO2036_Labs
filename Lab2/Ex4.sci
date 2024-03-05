clf

n = -5 : 5
msignal = zeros(n)

for i = 1 : length(n)
    if n(i) >= 0 then
        msignal(i) = n(i)
    else
        msignal(i) = 0
    end
end

plot2d3(n, msignal)
title("u_r(n)")
xlabel("n")
ylabel("u_r")
