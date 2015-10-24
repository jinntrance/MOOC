function intMul(x,y):Int64
	lx=length(x)
	ly=length(y)
	if(lx<=2 || ly<=2)
		return int(x)*int(y)
	else
		low=int(min(lx/2,ly/2))
		a=x[1:end-low] # 两数的低位，位数要一致。
		b=x[end-low+1:end]
		c=y[1:end-low]
		d=y[end-low+1:end]
		#println(a,",",b,",",c,",",d)
		ac=intMul(a,c)
		bd=intMul(b,d)
		combine = intMul(string(int(a)+int(b)),string(int(c)+int(d)))
		#println(ac,",",bd,",",combine)
		r = 10^(2*low)*ac+bd+10^low*(combine-ac-bd)
		#println(r)
		return r
	end
end