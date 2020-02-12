!the imroved_euler_method of y'=y-2x/y (0<=x<=1)
program improved_euler_method
	implicit none
	real :: x , y , yp , yc , h
	h =  0.1 
	x =  0.0
	y =  1.0
	open ( unit = 10 , file = 'improved_euler_method.ods' )
	write ( 10 , 100 ) x , y
	do x = 0.0 , 0.9 , 0.1
		yp = y + h * ( y - 2.0 * x / y )
		yc = y + h * ( yp - 2.0 * ( x + 0.1 ) / yp )
		y = 1.0 / 2.0 * ( yp + yc ) !notes: the data type must be consistent! 1.0/2.0 can not be 1/2.
		write ( 10 , 100 ) x + 0.1 , y
	enddo
	100 format ( 1x , f10.6 , f10.6 )
end program improved_euler_method
