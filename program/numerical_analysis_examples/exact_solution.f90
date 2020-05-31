!the exact solution of y'=y-2x/y (0<=x<=1) is y=sqrt(1+2x)
program exact_solution
	implicit none
	real :: x , y
	open ( unit = 10 , file = 'exact_solutions.ods' )
	do x = 0 , 1.0 , 0.1 !attention 1 must be 1.0 , the data type must be consistent!
		y = sqrt ( 1 + 2 * x )
		write ( 10 , 100 ) x , y
	enddo
	100 format( 1x , f10.6 , f10.6 )
end program exact_solution
