function swap(arr, i, j)
	temp = arr[i]
	arr[i] = arr[j]
	arr[j] = temp
end

function quicksort(arr, beginIdx, endIdx)

	if endIdx <= beginIdx
		return 0
	end
	m = endIdx - beginIdx+1
	# choose a pivot
	p1 = arr[beginIdx] 
	p3 = arr[endIdx] 
	mIdx = round(Int,floor((beginIdx+endIdx)/2))
	p2 = arr[mIdx]

	#pivot = p1 # the first as pivot
	#pivot = p3 # the last as pivot
	# the median as pivot
	pivot = round(Int,median([p1 p2 p3]))
	if pivot == p3
		swap(arr, beginIdx, endIdx)
	elseif pivot == p2
		swap(arr, beginIdx, mIdx)
	end
	pivotIdx = beginIdx
	beginIdx += 1
	i = beginIdx
	for j = beginIdx:endIdx
		if arr[j]<pivot
			swap(arr, i, j)
			#if pivot < arr[i]
			#	swap(arr, i, j)
			#end
			i+=1
		end
	end
	lowerEnd = i-1
	swap(arr,pivotIdx, i-1)

	return m-1 + quicksort(arr,pivotIdx, lowerEnd-1) + quicksort(arr,lowerEnd+1, endIdx)
end

data=readdlm("QuickSort.txt",';',Int, header=false)
println(quicksort(data, 1, length(data)))