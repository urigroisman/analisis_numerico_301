using Symbolics
using BenchmarkTools

@variables x

q = prod(x - i for i in 1:30)
q_exact = expand(q)

p = prod(x - Float64(i) for i in 1:30);
p_float_64 = expand(p);


setprecision(BigFloat, 128) do
    r = prod(x - BigFloat(i) for i in 1:30);
    global r_float_128 = expand(r);
end

setprecision(BigFloat, 256) do
    s = prod(x - BigFloat(i) for i in 1:30);
    global s_float_256 = expand(s);
end



for j in 1:30
    println("x = $j")
    
    err_exact = substitute(q_exact, x => j)
    println("err_exact = ", err_exact)
    
    err_float_64 = substitute(p_float_64, x => Float64(j))
    println("err_float_64 = ", err_float_64)
    
    setprecision(BigFloat, 128) do 
        err_Bfloat_128 = substitute(r_float_128, x => BigFloat(j))
        println("err_Bfloat_128 = ", err_Bfloat_128)   
    end
    
    setprecision(BigFloat, 256) do 
    err_Bfloat_256 = substitute(s_float_256, x => BigFloat(j))
    println("err_Bfloat_256 = ", err_Bfloat_256)
    end
    
    println("================================")
    println()
end