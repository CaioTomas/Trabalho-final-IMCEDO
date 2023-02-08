module IVP_solver_RK4

    use :: constants

    contains

        subroutine IVP_solver_RK(N, h, lambda, sol_u, flag)

            double precision, dimension(tamanho), intent(in out) :: sol_u
            double precision, intent(in) :: h, lambda
            integer, intent(in) :: N, flag
            double precision, dimension(tamanho) :: xi1, xi2, xi3, xi4

            integer :: i

            sol_u(1) = 1.d0
            sol_u(2) = 0.d0

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

                open(unit=1234,file='saida_singproblem_auto1.dat', status='unknown')

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

            if (t .eq. 0.d0) then

                f(1) = sol_u(2)
                f(2) = -lambda*sol_u(1)
                ! f(1) = 0.d0
                ! f(2) = 0.d0
            
            else

                f(1) = sol_u(2)
                f(2) = -(sol_u(2) + lambda*t*sol_u(1))/t 

            end if

            return

        end function f


end module IVP_solver_RK4