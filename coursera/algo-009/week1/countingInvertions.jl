function mergeAndCountSplitInv(a1, a2, len1, len2)
	cnt = 0;
	merged = Int[]
	sizehint(merged, len1+len2)

	i,j=1,1

	while(i<=len1 && j<=len2)
		if a1[i] > a2[j]
			cnt += len1-i+1 # count inversions
			# push the smaller one to the merged array
			push!(merged, a2[j]) 
			j+=1
		else
			push!(merged, a1[i])
			i+=1
		end
	end

	while(i<=len1)
		push!(merged, a1[i])
		i+=1
	end

	while(j<=len2)
		push!(merged, a2[j])
		j+=1
	end

	#println("var $(a1), $a2")
	#println("meged arr $merged")
	return cnt, merged
end

function sortAndCountInv(arr, len)
	
	if 1==len
		return 0, arr
	end
	h = int(len/2) # half of the length
	c1, a1 = sortAndCountInv(arr[1:h], h)
	c2, a2 = sortAndCountInv(arr[h+1:end], len-h)
	cm, am = mergeAndCountSplitInv(a1, a2, h, len-h)
	return c1 + c2 + cm , am
end

c, a = sortAndCountInv([1 3 5 2 4 6], 6)
assert(3==c)
c, a = sortAndCountInv([1 4 6 3 5 2], 6)
assert(7==c)

# dowload this text file from coursera
# http://spark-public.s3.amazonaws.com/algo1/programming_prob/IntegerArray.txt
data=readdlm("IntegerArray.txt",';',Int, header=false)
sortAndCountInv(data, 100000)

