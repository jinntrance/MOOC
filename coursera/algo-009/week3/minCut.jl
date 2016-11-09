
function minCut(v_list, A, B, mc)

	# remove self-loops

	new_A_O = []
	for j in A
		for i in v_list[j]
			if ! in(i, A)
				push!(new_A_O, i)
			end
		end
	end
	new_A_O

	#println("edeges: ", new_A_O)
	#println("A:", A, "-->B: ", B)
	if length(new_A_O)< mc
		mc = length(new_A_O)
	end
	# stop at 
	if length(A) >= length(B)
	#if 1 >= length(B)
		#println("minCut: ", mc)
		return length(new_A_O)
	end
	for n in Set(new_A_O)
		mc_n = minCut(v_list, union(A, [n]), setdiff(B, [n]), mc)
		if mc_n < mc
			mc = mc_n
		end
	end

	println("minCut: ", mc)
	return mc
end

vertices=readdlm("kargerMinCut.txt")
#vertices=readdlm("kargerMinCutSample.txt")

m,n = size(vertices)

matrix = zeros(Int,m,n)

v_list=[]
e_n = 0;

for i = 1:m
	r = Int(vertices[i,1])
	ri = []
	for j = 2:n
		if 0 < length(vertices[i,j])
			c = Int(vertices[i,j])
			push!(ri, c)
			e_n += 1
			matrix[r,c]=1
		end
	end
	push!(v_list, ri)
end

vt = Dict()

for i in 1:m
	vt[i]=v_list[i]
end

for k = 1:50
	v_l = copy(v_list)
	for l = 1:(e_n-1)
		i = 1+int(rand()*size(v_l,1))
		j = 1+ int(rand()*length(v_l[i]))
		c =v_l[i][j]
	end
end
