function wrap_cell(ic, jc, data)

	iw = ic
	jw = jc

	if iw < 1
		iw = data.l
	elseif iw > data.l
		iw = 1
	end

	if jw < 1
		jw = data.l
	elseif jw > data.l
		jw = 1
	end

	return iw, jw
end
