!the euler's_method of y'=y-2x/y (0<=x<=1) 
program euler_method
	implicit none
	real :: x , y , h
	h = 0.1
	x = 0.0
	y = 1.0
	open ( unit = 10 , file = 'euler_method.ods' )
	write ( 10 , 100 ) x , y
	do x = 0.0 , 0.9 , 0.1
		y = y + h * ( y - 2 * x / y )
		write ( 10 , 100 ) x + 0.1 , y
	enddo
	100 format ( 1x , f10.6 , f10.6 )
end program euler_method
