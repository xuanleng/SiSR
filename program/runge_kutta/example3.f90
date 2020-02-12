program example3
	real*8 :: x , y0 , y1 , y2 , h
	h = 1.0d0 / 20.0d0
	open ( unit = 10 , file = "example3.ods" )
	do x = 0.0d0 , 1.0d0 , h
		y0 = - cos( x )
		y1 = sin ( x )
		y2 = exp ( -x )
		write ( * ,100 )x, y0 , y1 , y2
		write ( 10 , 100 )x, y0 , y1 , y2
	enddo
	100 format ( 1x , f19.8 ,f19.8 , f19.8 , f19.8 )
end program example3
