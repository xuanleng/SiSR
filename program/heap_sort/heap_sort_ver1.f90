program main
	implicit none
	real*8 :: array(0:9) = [1.0d0,3.0d0,4.0d0,5.0d0,2.0d0,6.0d0,9.0d0,7.0d0,8.0d0,0.0d0]
	integer :: length = 10
	integer :: i
	real*8 :: temp

	print 100, array
	do i = length/2,0,-1
		print *, i
		call heapinit(array,i,length-1)
		print 100, array
	enddo

	do i = length-1,1,-1
		temp = array(i)
		array(i) = array(0)
		array(0) = temp
		call heapinit(array,0,i)
		print 100, array
	enddo

	100 format(10(f10.1))
end program main


subroutine heapinit(array,i,length)
	implicit none
	integer, intent(in) :: length
	integer, intent(in) :: i
	integer :: parent
	integer :: child
	real*8 :: temp
	real*8, intent(inout) :: array(0:9)

	parent = i
	temp = array(parent)
	child = 2*parent+1 ! left child

	do while( child<length )
		!if the right child value greater than left child, then we choose the right child
		if (child+1<length .and. array(child)<array(child+1)) then
			child = child + 1
		endif
		if (temp >= array(child)) then
			exit
		else
			array(parent) = array(child)
			parent = child
			child = 2*child+1
		endif
		array(parent) = temp
	enddo
end subroutine heapinit
