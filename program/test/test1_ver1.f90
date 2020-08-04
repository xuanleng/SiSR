program test
	implicit none
	real*8 :: alp = 1.0, bet = 0.0
	integer:: Ns = 3
	integer:: i = 0
	real*8 :: hs(3,3) = & 
    &reshape([ 250.0d0, 100.0d0,  10.0d0, &
             & 100.0d0, 300.0d0,  10.0d0, &
             &  10.0d0,  10.d00, 600.0d0  ], [3,3] , order=[2,1] )
	real*8 :: a1(3,3) = 0
	call DGEMM('N', 'N', Ns, Ns, Ns, alp, hs, Ns, hs, Ns, bet, a1, Ns)
	open( unit = 10 , file = "hs*hs_ver1.ods")
	do i = 1, 3
		print 100 , a1(i,1), a1(i,2), a1(i,3)
		write(10,100) a1(i,1) , a1(i,2) , a1(i,3)
	enddo

	100 format( 3(f10.1,',') )
end program test
