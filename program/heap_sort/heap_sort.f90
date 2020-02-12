program main
	implicit none
	integer, parameter :: length = 7
	real*8 :: array(length) = [70.0d0,60.0d0,12.0d0,40.0d0,30.0d0,8.0d0,10.0d0]
	integer :: i
	real*8 :: temp

	print 100, array
	do i = length/2,1,-1
		print *, i
		call heapinit(array,i,length)
		print 100, array
	enddo

	print *, 'heap sort'
	do i = length,1,-1
		temp = array(i)
		array(i) = array(1)
		array(1) = temp
		call heapinit(array,1,i)
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
	real*8, intent(inout) :: array(length)

	parent = i
	temp = array(parent)
	child = 2*parent ! left child

	do while( child<length )
		!if the right child value greater than left child, then we choose the right child
		if (child+1<length .and. array(child)<array(child+1)) then
			child = child+1
		endif
		if (temp >= array(child)) then
			exit
		else
			array(parent) = array(child)
			parent = child
			array(parent) = temp
			child = 2*parent
		endif
	enddo
end subroutine heapinit
