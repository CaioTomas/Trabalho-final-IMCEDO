module IVP_solver

    use :: constants

    contains

        subroutine IVP_solver_u(N, h, lambda, sol_u, flag)

            double precision, dimension(tamanho), intent(in out) :: sol_u
            double precision, intent(in) :: h, lambda
            integer, intent(in) :: N, flag

            integer :: i

            sol_u(1) = -beta/dsqrt(alpha**2.d0 + beta**2.d0)
            sol_u(2) = alpha/dsqrt(alpha**2.d0 + beta**2.d0)

            if (flag .eq. 0) then
                
                do i = 0, N-1
                    sol_u = sol_u + h*0.5d0*( f( lambda, i*h, sol_u ) &
                    &+ f( lambda, (i+1)*h, sol_u + h*f( lambda, i*h, sol_u ) ) )
                end do

            else

                open(unit=1234,file='saida_firstproblem_auto5.dat', status='unknown')

                write (1234,*) 0.d0, sol_u

                do i = 0, N-1
                    sol_u = sol_u + h*0.5d0*( f( lambda, i*h, sol_u ) &
                    &+ f( lambda, (i+1)*h, sol_u + h*f( lambda, i*h, sol_u ) ) )

                    write (1234,*) (i+1)*h, sol_u
                end do

                close(unit=1234)

            end if

            return

        end subroutine IVP_solver_u


        function f(lambda, t, sol_u)

            double precision :: lambda, t
            double precision, dimension(tamanho), intent(in) :: sol_u
            double precision, dimension(tamanho) :: f

            f(1) = sol_u(2)
            f(2) = -lambda*sol_u(1)

            return

        end function f


end module IVP_solver