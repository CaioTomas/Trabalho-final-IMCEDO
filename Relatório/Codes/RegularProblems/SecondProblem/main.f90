program main

    use :: constants
    use :: IVP_solver_RK4

    k = 0
    flag = 0

    a = 200.d0
    b = 350.d0

    do while (flag .eq. 0)

        k = k + 1

        lambda = (a + b)/2.d0

        call IVP_solver_RK(N, h, a, sol_u, flag)
        
        sol_a = sol_u

        call IVP_solver_RK(N, h, lambda, sol_u, flag)

        F_aux_a = gamma*sol_a(1) + delta*sol_a(2)
        F_aux_u = gamma*sol_u(1) + delta*sol_u(2)

        write (*,*) F_aux_a, F_aux_u

        if (abs(F_aux_u) .le. tol) then
            flag = 1
        else
            if (F_aux_a*F_aux_u .lt. 0.d0) then
                b = lambda
            else
                a = lambda
            end if
        end if

        write (*,*) k, lambda

    end do

    write (*,*) 'Number of iterations:', k
    write (*,*) 'Eigenvalue found:', lambda
    ! write (*,*) 'n = ', dsqrt(lambda)/dacos(-1.d0)

    call IVP_solver_RK(N, h, lambda, sol_u, flag)

end program main