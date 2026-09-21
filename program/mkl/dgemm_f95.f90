program dgemm_f95
	use mkl95_precision
	use mkl95_blas
	implicit none
	integer :: i = 0
	real*8 :: hs(3,3) = & 
    &reshape([ 250.0d0, 100.0d0,  10.0d0, &
             & 100.0d0, 300.0d0,  10.0d0, &
             &  10.0d0,  10.0d0, 600.0d0  ], [3,3] , order=[2,1] )
	real*8 :: a1(3,3) = 0
	call GEMM(hs,hs,a1)
	open( unit = 10 , file = "dgemm_f95.dat")
	do i = 1, 3
		print 100 , a1(i,1), a1(i,2), a1(i,3)
		write(10,100) a1(i,1) , a1(i,2) , a1(i,3)
	enddo

	100 format( 3(f10.1,',') )
end program dgemm_f95
