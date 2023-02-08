module constants

    implicit none

    integer, parameter :: tamanho = 2
    integer, parameter :: N = 1000

    double precision, parameter :: h = 1.d-3
    double precision, parameter :: tol = 1.d-9

    double precision, parameter :: alpha = 1.d0
    double precision, parameter :: beta = 0.d0
    double precision, parameter :: gamma = 1.d0
    double precision, parameter :: delta = 1.d0
    
    integer :: k, flag

    double precision, dimension(tamanho) :: sol_u, sol_a, sol_b

    double precision :: a, b, lambda, F_aux_u, F_aux_a


end module constants