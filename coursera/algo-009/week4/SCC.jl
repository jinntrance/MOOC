edges = readdlm("SCC.txt");

E = size(edges,1) # number of edges
N = maximum(edges[:,1]) # number of nodes

G = Dict{Int, Array{Int,1}}()
G_rev = Dict{Int, Array{Int,1}}()

# build graph G and G's reverse G_rev
for e = 1:E
  head = edges[e,2];
  tail =  edges[e,1];
  if haskey(G, tail)
  	push!(G[tail], head)
  else
  	G[tail] = [head]
  end
  if haskey(G_rev, head)
  	push!(G_rev[head], tail)
  else
  	G_rev[head] = [tail]
  end
end

function DFS_Loop(G, iter, ft, leader, explored)
	#println("working on ", iter[1])
	global t =0 , s= 0;
	for i in iter
		if 0 == explored[i]
			s = i
			DFS(G, i, ft, leader, explored)
		end
	end
end

function DFS(G,i, ft, leader, explored)
	#print("exploring ", i, "\r")
	explored[i] = 1
	leader[i] = s
	if haskey(G, i)
		for j in sort(G[i])
			if 0 == explored[j]
				DFS(G,j, ft, leader, explored)
			end
		end
	end
	global t += 1
	ft[t] = i # i was explored at time t
end

explored = zeros(Int,N);
leader_r = zeros(Int,N);
ft_r = zeros(Int,N);

# the fist pass
DFS_Loop(G_rev, reverse(1:N), ft_r, leader_r, explored)

explored = zeros(Int,N)
leader = zeros(Int,N)
ft = zeros(Int,N)

# in the second pass, 
DFS_Loop(G, reverse(ft_r), ft, leader, explored)

G = []

SCC = Dict()

for i = 1:N
	l = leader[i]
	# leaders in the second pass decide the size of the SCCs
	if l > 0 
		if haskey(SCC, l)
			push!(SCC[l], i)
		else
			SCC[l]=[i]
		end
	end
end

SCC_count = []
for key in collect(keys(SCC))
	if(length(SCC[key])>0)
		push!(SCC_count, length(SCC[key]))
	end
end

# print the biggest SCCs' size
#println(sortrows(SCC_count, by=x->x[2], rev=true)[1:5, 2])
println(sort(SCC_count, rev=true)[1:5])
