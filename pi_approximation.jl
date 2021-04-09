using Distributed

## Function to get the number of points inside a circle
function in_circle_points(n)
    points_in = 0 ## Points inside the circle
    for i = 1:n
        x, y = rand(), rand() ## Randomly generate x,y btwn 0 & 1
        ## Count if generated value is within radius of the circle
        ## int the unit square
        points_in += (x*x + y*y) <= 1
    end
    ## Return the number of points in
    return points_in
end

## Run code in parallel across n cores
function parallel_pi(n)
    ## Create the number of workers specified by the
    p = nworkers()
    ## Combine results via addition (+)
    n_in = @distributed (+) for i=1:p
        in_circle_points(n / p)
    end
    return 4 * n_in / n ## Approximation of pi
end

## Run code serially on 1 worker
function serial_pi(n)
    n_in = in_circle_points(n)
    return 4 * n_in / n
end
