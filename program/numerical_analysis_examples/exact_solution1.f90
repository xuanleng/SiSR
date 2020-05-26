!the exact solution of y'=y-2x/y (0<=x<=1) is y=sqrt(1+2x)
!this is the improve version of exact_solution.f90, because its higher precison.
program exact_solution1
	implicit none
	real*8 :: x , y
	open ( unit = 10 , file = 'exact_solutions_improved.ods' )
	do x = 0d0 , 1.0d0 , 0.1d0 !attention 1 must be 1.0 , the data type must be consistent!
		y = sqrt ( 1.0d0 + 2.0d0 * x )
		write ( 10 , * ) x , y
	enddo
end program exact_solution1
