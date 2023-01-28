program metodo_tiro_EulerMelhorado_Bissec

    implicit none

    double precision, dimension(:), allocatable :: sol_u
    double precision :: h, lambda, tol, a, b, sol_a, sol_b
    integer :: N, tamanho, k

    ! quero resolver o problema de SL
    ! y'' + lambda y = 0
    ! y(0) = y(1) = 0
    ! que tem autovalores (npi)^2 e autofunções sen(n pi x), n = 1, 2, ...

    tol = 1.d-9

    tamanho = 2

    a = 38.d0
    b = 40.d0

    allocate(sol_u(tamanho))

    h = 0.00001d0
    N = 100000

    k = 0

    do while (1 .eq. 1)

        k = k + 1

        lambda = (a + b)/2.d0

        ! resolver o PVI auxiliar
        ! u'' + lambda u = 0
        ! u(0) = 0, u'(0) = 1
        ! em [0,1]

        call IVP_solver_u(N, tamanho, h, a, sol_u)
        
        sol_a = sol_u(1)

        call IVP_solver_u(N, tamanho, h, b, sol_u)
        
        sol_b = sol_u(1)

        call IVP_solver_u(N, tamanho, h, lambda, sol_u) ! me cospe o vetor sol_u, que representa (u(1), u'(1))

        if (abs(sol_u(1)) .le. tol) then
            exit
        else
            if (sol_a*sol_u(1) .lt. 0.d0) then
                b = lambda
            else
                a = lambda
            end if

        end if

    end do

    write (*,*) 'Número de iterações:', k
    write (*,*) 'Autovalor encontrado:', lambda

    call IVP_solver_u(N, tamanho, h, lambda, sol_u)

    write (*,*) sol_u

    deallocate(sol_u)

contains

    subroutine IVP_solver_u(N, tamanho, h, lambda, sol_u)

        implicit none

        double precision, dimension(tamanho), intent(in out) :: sol_u
        double precision :: h, lambda
        integer :: N, tamanho, i

        sol_u(1) = 0.d0
        sol_u(2) = 1.d0

        open(unit=1234,file='saida_tiro.dat', status='unknown')

        write (1234,*) 0.d0, sol_u

        do i = 0, N-1
            sol_u = sol_u + h*0.5d0*( f_sol_u( lambda, i*h, sol_u, tamanho ) &
            &+ f_sol_u( lambda, (i+1)*h, sol_u + h*f_sol_u( lambda, i*h, sol_u, tamanho ), tamanho ) )

            write (1234,*) (i+1)*h, sol_u
        end do

        close(unit=1234)

        return

    end subroutine IVP_solver_u


    function f_sol_u(lambda, t, sols, tamanho)

        implicit none

        double precision, dimension(tamanho) :: f_sol_u, sols
        double precision :: lambda, t
        integer :: tamanho

        f_sol_u(1) = sols(2)
        f_sol_u(2) = -lambda*sols(1)

        return

    end function f_sol_u


end program metodo_tiro_EulerMelhorado_Bissec