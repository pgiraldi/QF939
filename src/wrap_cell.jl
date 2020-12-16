function wrap_cell(ic, jc, l)

	iw = ic
	jw = jc

	if iw < 1
		iw = l
	elseif iw > l
		iw = 1
	end

	if jw < 1
		jw = l
	elseif jw > l
		jw = 1
	end

	return iw, jw
end
