% Clears all variables from the workspace.
clear all

% Closes all open figures (windows).
close all 

% Clears the command window to ensure no previous output is displayed.
clc

%% Tic-tac-toe

% Create 3x3 matrix full of zeros
board = zeros(3, 3);

%% Check win function
function win = check_win(board)
    % Check rows and columns
    for i = 1:3
        if all(board(i, :) == board(i, 1)) && board(i, 1) ~= 0
            win = board(i, 1); % Return winner (1 or 2)
            return;
        end
        if all(board(:, i) == board(1, i)) && board(1, i) ~= 0
            win = board(1, i); % Return winner (1 or 2)
            return;
        end
    end
    
    % Check diagonals
    if all(diag(board) == board(1, 1)) && board(1, 1) ~= 0
        win = board(1, 1); % Return winner (1 or 2)
        return;
    end
    if all(diag(flipud(board)) == board(1, 3)) && board(1, 3) ~= 0
        win = board(1, 3); % Return winner (1 or 2)
        return;
    end
    
    % If no winner, return 0
    win = 0;
end

%% Main Game Loop
currentPlayer = 1;  % Player 1 starts

while true
    % Ask for Player inputs
    while true
        row = input('Please enter the row number (1-3): ');
        if isnumeric(row) && (mod(row, 1) == 0) && (row >= 1) && (row <= 3)
            if board(row, :) ~= 0
                disp('Error: Row is already occupied. Please choose another row.');
            else
                break; % Valid input, exit loop
            end
        else
            disp('Error: You must enter an integer between 1 and 3.');
        end
    end

    while true
        column = input('Please enter the column number (1-3): ');
        if isnumeric(column) && (mod(column, 1) == 0) && (column >= 1) && (column <= 3)
            if board(:, column) ~= 0
                disp('Error: Column is already occupied. Please choose another column.');
            else
                break; % Valid input, exit loop
            end
        else
            disp('Error: You must enter an integer between 1 and 3.');
        end
    end

    % Update the board for the current player
    board(row, column) = currentPlayer;

    % Display the updated board
    disp('Updated board:');
    disp(board);

    % Check for a winner
    winner = check_win(board);
    if winner ~= 0
        disp(['Player ', num2str(winner), ' wins!']);
        break; % End the game if there is a winner
    end

    % Switch players
    if currentPlayer == 1
        currentPlayer = 2;
    else
        currentPlayer = 1;
    end
end
