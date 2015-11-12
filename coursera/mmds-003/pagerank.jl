edges = 1 + readdlm("web-Google.txt",Int);

E = size(edges,1)
N = maximum(edges[:,1])

beta = 0.8

println(E,"\t",N)

r = ones(N);

d = zeros(N); # degress

for e = 1:E
  h = edges[e,1];
  d[h] += 1;
end

out = zeros(E); # out-links weight

for e = 1:E
  out[e] = 1 / d[edges[e,1]];
end

epsil = N * 1e-10

M = sparse(edges[:,2],edges[:,1], out ) 

delta = epsil
while(delta >= epsil)
  r = beta * M * r 
  delta = (N-sum(r))/N
  #delta = 1-beta
  r += delta
  println(r[99+1]/N)
end
println(r[99+1]/N)