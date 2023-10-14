program matrix_x_vector_main

    implicit none
    integer, parameter :: RAND_MAX = 100
    integer, parameter :: N = 30000
    integer, dimension(:,:), allocatable :: matrix
    integer, dimension(:), allocatable :: vector, result
    integer :: i, j
    real :: start_time, end_time, elapsed_time, clock_rate
    
    call srand(time())
    
    ! Alocando memoria
    allocate(matrix(N,N))
    allocate(vector(N))
    allocate(result(N))
    
    ! GErando os numeros
    do i = 1, N
        vector(i) = int(real(rand()) * 100)
        do j = 1, N
            matrix(i,j) = int(real(rand()) * 100)
        end do
    end do
    
    ! Contando o tempo da operacao
    call cpu_time(start_time)
    call matrix_x_vector_sub(matrix, vector, result)
    call cpu_time(end_time)
    elapsed_time = end_time - start_time
    write(*,*) "Time taken for multiplication in fortran:", elapsed_time, "seconds"
    
    ! Liberando a memoria
    deallocate(matrix)
    deallocate(vector)
    deallocate(result)
    
contains
    
    subroutine matrix_x_vector_sub(matrix, vector, result)
        integer, dimension(:,:), intent(in) :: matrix
        integer, dimension(:), intent(in) :: vector
        integer, dimension(:), intent(out) :: result
        integer :: i, j
    
        do i = 1, size(matrix,1)
            do j = 1, size(matrix,2)
                result(i) = result(i) + matrix(i,j) * vector(j)
            end do
        end do
    end subroutine matrix_x_vector_sub

end program matrix_x_vector_main
