module IVP_solver_RK4

    use :: constants

    contains

        subroutine IVP_solver_RK(N, h, lambda, sol_u, flag)

            double precision, dimension(tamanho), intent(in out) :: sol_u
            double precision, intent(in) :: h, lambda
            integer, intent(in) :: N, flag
            double precision, dimension(tamanho) :: xi1, xi2, xi3, xi4

            integer :: i

            sol_u(1) = -beta/dsqrt(alpha**2.d0 + beta**2.d0)
            sol_u(2) = alpha/dsqrt(alpha**2.d0 + beta**2.d0)

            if (flag .eq. 0) then
                
                do i = 0, N-1
                    xi1 = sol_u
                    xi2 = sol_u + 0.5d0*h*f(lambda, i*h + 0.5d0*h, xi1)
                    xi3 = sol_u + 0.5d0*h*f(lambda, i*h + 0.5d0*h, xi2)
                    xi4 = sol_u + h*f(lambda, i*h + h, xi3)

                    sol_u = sol_u + h*(f(lambda, i*h, xi1) + 2.d0*f(lambda, i*h + 0.5d0*h, xi2)&
                    &+ 2.d0*f(lambda, i*h + 0.5d0*h, xi3) + f(lambda, i*h + h, xi4))/6.d0
                end do

            else

                open(unit=1234,file='saida_firstproblem_auto5.dat', status='unknown')

                write (1234,*) 0.d0, sol_u

                do i = 0, N-1
                    xi1 = sol_u
                    xi2 = sol_u + 0.5d0*h*f(lambda, i*h + 0.5d0*h, xi1)
                    xi3 = sol_u + 0.5d0*h*f(lambda, i*h + 0.5d0*h, xi2)
                    xi4 = sol_u + h*f(lambda, i*h + h, xi3)

                    sol_u = sol_u + h*(f(lambda, i*h, xi1) + 2.d0*f(lambda, i*h + 0.5d0*h, xi2)&
                    &+ 2.d0*f(lambda, i*h + 0.5d0*h, xi3) + f(lambda, i*h + h, xi4))/6.d0

                    write (1234,*) (i+1)*h, sol_u
                end do

                close(unit=1234)

            end if

            return

        end subroutine IVP_solver_RK


        function f(lambda, t, sol_u)

            double precision :: lambda, t
            double precision, dimension(tamanho), intent(in) :: sol_u
            double precision, dimension(tamanho) :: f

            f(1) = sol_u(2)
            f(2) = -lambda*sol_u(1)

            return

        end function f


end module IVP_solver_RK4