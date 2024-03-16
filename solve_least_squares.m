function [x, residual_norm] = solve_least_squares(A, b)
    % Perform QR decomposition using MATLAB's built-in qr function
    [Q, R] = qr(A, 0); % '0' for economy-size decomposition
    
    % Compute c using the Q matrix from the QR decomposition
    c = Q' * b;
    
    % Solve the triangular system R(1:m, :)x = c for x using back substitution
    x = backward(R(1:min(size(A)), :), c(1:min(size(A)))); % Adjust R for the correct size
    
    % Compute the residual (b - Ax)
    residual = b - A * x;
    
    % Compute the Euclidean norm of the residual
    residual_norm = norm(residual, 2);
end