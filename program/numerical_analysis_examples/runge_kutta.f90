!the 4 order runge_kutta of y'=y-2x/y (0<=x<=1)
program runge_kutta
	implicit none
	real :: x , y , h , k1 , k2 , k3 , k4
	h = 0.1
	x = 0.0
	y = 1.0
	open ( unit = 10 , file = 'runge_kutta.ods' )
	write ( 10 ,100 ) x , y
	do x = 0.0 , 0.9 , 0.1
		k1 = y - 2.0 * x / y
		k2 = y + h / 2.0 * k1 - ( 2.0 * x + h ) / ( y + h / 2.0 * k1)
		k3 = y + h / 2.0 * k2 - ( 2.0 * x + h ) / ( y + h / 2.0 * k2 )
		k4 = y + h * k3 - 2.0 * ( x + h ) / ( y + h * k3 )
		y = y + h / 6.0 * ( k1 + 2.0 * k2 + 2.0 * k3 + k4 )
		write ( 10 ,100 ) x + 0.1 , y
	enddo
	100 format ( 1x , f10.6 , f10.6 )
end program runge_kutta
