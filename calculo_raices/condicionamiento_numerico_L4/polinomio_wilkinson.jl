using Symbolics

@variables x

p = prod(x - Float64(i) for i in 1:20)
p_fact = expand(p)

q = prod(x - i for i in 1:20)
q_fact = expand(q)

setprecision(BigFloat, 128) do
    r = prod(x - BigFloat(i) for i in 1:20)
    r_fact = expand(r)
end

setprecision(BigFloat, 256) do
    s = prod(x - BigFloat(i) for i in 1:20)
    s_fact = expand(s)
end

p_fact
r_fact
s_fact

for j in 1:20
    err_simb = substitute(q_fact, x => j)
    err_float = substitute(p_fact, x => Float64(j))
    err_Bfloat_256 = substitute(r_fact, x => BigFloat(j))
    setprecision(BigFloat, 128) do 
        err_Bfloat_128 = substitute(s_fact, x => BigFloat(j))   
    end
    setpresicion(BigFloat, 256)
    println("x = $j", "\t", "err_simb = ", err_simb, "\t", "err_Bfloat_256 = ", err_Bfloat_256, "\t", "err_Bfloat_128 = ", err_Bfloat_128, "\t", "err_float_64 = ", err_float)
end