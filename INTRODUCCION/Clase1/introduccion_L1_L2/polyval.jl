# L-1 MCS 471 Mon 22 Aug 2022 : polyval.jl
# Four functions are defined to evaluate a polynomial:
# (1) In one expression, with an array comprehension;
# (2) With a function declaration;
# (3) Accumulating the powers in a for loop;
# (4) Horner's method in a nested scheme.

using BenchmarkTools

polyval(c, x) = sum([c[i]*x^(i-1) for i=1:length(c)])

"""
Returns the value of the polynomial with coefficients in cff
at the argument arg, using an array comprehension.
"""
function polyfun(cff::Array, arg::Float64)
    values = [cff[i]*arg^(i-1) for i = 1:length(cff)]
    return sum(values)
end

"""
Returns the value of the polynomial with 
coeffients in cff at the argument arg.
The coefficient of the constant term is at cff[1].
The powers of the argument are accumulated.
"""
function evaluate(cff::Array, arg::Float64)
    result = cff[1] # constant coefficient
    argpow = 1.0    # accumulates power of argument
    for i = 2:length(cff)
        argpow = argpow*arg # arg^(i-1)
        result = result + cff[i]*argpow
    end
    return result
end

"""
Returns the value of the polynomial with 
coeffients in cff at the argument arg.
The coefficient of the constant term is at cff[1].
Applies the nested scheme of Horner.
"""
function Horner(cff::Array, arg::Float64)
    index = length(cff)
    result = cff[index]
    index = index - 1
    while index > 0
        result = result*arg + cff[index]
        index = index - 1
    end
    return result
end

"""
Prompts the user for the degree 
and generates the coefficients
of a polynomial in one variable.
"""
function main()
    print("Give the degree : ")
    line = readline(stdin)
    deg = parse(Int, line)
    cff = rand(deg+1)
    strcff = string(cff)
    println("coefficients : $strcff")
    print("Give the value for x : ")
    line = readline(stdin)
    arg = parse(Float64, line)
    strarg = string(arg)
    @time val = polyval(cff, arg)
    strval = string(val)
    println("The value at $strarg : $strval")
    @time val = polyfun(cff, arg)
    strval = string(val)
    println("The value at $strarg : $strval")
    @time val = evaluate(cff, arg)
    strval = string(val)
    println("The value at $strarg : $strval")
    @time val = Horner(cff, arg)
    strval = string(val)
    println("The value at $strarg : $strval")
end

main()
