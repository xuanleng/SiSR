subroutine rk4( xin , yin , n , h , yout )
	implicit none
	real*8 :: yin( 0 : n-1 ) , ya( 0 : n-1 ) , yb( 0 : n-1 ) , yc( 0 : n-1 ) , yout( 0 : n-1 )
	real*8 :: k1( 0 : n-1 ) , k2( 0 : n-1 ) , k3( 0 : n-1 ) , k4( 0 : n-1 )
	real*8 :: h , h2 , h6 , xin , xh
	integer :: i , n 
	h2 = h / 2.0d0
	h6 = h / 6.0d0
	xh = xin + h2
	call equation( xin , yin , k1 )
	do i = 0 , n-1
		ya(i) = yin(i) + h2 * k1(i)
	enddo
	call equation( xh , ya , k2 )
	do i = 0 , n-1
		yb(i) = yin(i) + h2 * k2(i)
	enddo
	call equation( xh , yb , k3 )
	do i = 0 , n-1
		yc(i) = yin(i) + h * k3(i)
	enddo
	call equation( xin+h , yc , k4 )
	do i = 0 , n-1
		yout(i) = yin(i) + h6 * ( k1(i) + 2.0d0 * k2(i) + 2.0d0 * k3(i) + k4(i) )
	enddo
end subroutine rk4


subroutine equation( x , y , dydx )
	real*8 :: y( 0: 2 ) , dydx( 0 : 2 )
	real*8 :: x
	dydx(0) = y(1)
	dydx(1) = -y(0)
	dydx(2) = -y(2)
end subroutine equation


program runge_kutta1
	real*8 :: x0 , y0( 0 : 2 ) , y1( 0 : 2 )  , h
	integer :: n
	x0 = 0d0
	y0(0) = -1.0d0
	y0(1) = 0.0d0
	y0(2) = 1.0d0
	h = 0.05d0
	n = 3
	open ( unit = 10 , file = 'runge_kutta3.ods' )
	write ( 10 , 100 ) x0 , y0 !输入到文本文件中
	write ( * , 100 ) x0 , y0  !输入到显示屏上
	do x0 =0d0 , 1.0d0 , h !数据类型，在整个程序中一定要写对，不然会出问题的。
		call rk4( x0 , y0 , n , h , y1 )
		y0 = y1 !这个是关键步骤之一，就是再次作为程序初值，没有这步，语法上没错，但算的总不对。因为初值不对，所以一定要注意。
		write( * , 100 ) x0+h ,  y1 !输入到文本文件中
		write( 10 , 100 ) x0+h , y1 !输入大显示屏上 
	enddo
	100 format ( 1x , f19.8 , f19.8 , f19.8 , f19.8 )
endprogram runge_kutta1
