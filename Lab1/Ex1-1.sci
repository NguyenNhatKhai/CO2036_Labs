// PART 1
function part1()
    x = 1:4
    v = x + 1
    disp(v)
endfunction
printf("Create a vector in the form of (x1+1, x2+1, x3+1, x4+1),\n")
printf("where x1, x2, x3, x4 are components of vector x = 1:4.\n")
part1()

// PART 2
function part2()
    x = 1:4
    y = 5:8
    v = x .*y
    disp(v)
endfunction
printf("\n\nCreate a vector in the form of (x1y1, x2y2, x3y3, x4y4)\n,")
printf("where x1…x4 and y1…y4 are components of vector x=1:4 and vector y=5:8, respectively.\n")
part2()

// PART 3
function part3()
    x = linspace(0, %pi, 10)
    v = sin(x)
    disp(v)
endfunction
printf("\n\nCreate a vector in the form of (sin(x1), sin(x2), . . . , sin(x10)),\n")
printf("where x is a vector of 10 values linearly chosen in the interval [0, π].\n")
part3()
