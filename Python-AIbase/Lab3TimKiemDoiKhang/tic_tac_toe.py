#!/usr/bin/env python3
from math import inf as infinity
from random import choice
import platform
import time
from os import system

"""
An implementation of Minimax AI Algorithm in Tic Tac Toe,
using Python.
This software is available under GPL license.
Author: Clederson Cruz
Year: 2017
License: GNU GENERAL PUBLIC LICENSE (GPL)
"""
BOARD_SIZE = 4
HUMAN = -1
COMP = +1

# board = [
#     [0, 0, 0],
#     [0, 0, 0],
#     [0, 0, 0],
# ]
board = []
# khởi tạo mảng 2D với giá trị 0, kích thước BOARD_SIZE
for i in range(0, BOARD_SIZE):
    board_row = []
    for j in range(0, BOARD_SIZE):
        board_row.append(0)
    board.append(board_row)


def evaluate(state):
    """
    Function to heuristic evaluation of state.
    :param state: the state of the current board
    :return: +1 if the computer wins; -1 if the human wins; 0 draw
    """
    if wins(state, COMP):
        score = +1
    elif wins(state, HUMAN):
        score = -1
    else:
        score = 0

    return score


def wins(state, player):
    """
    This function tests if a specific player wins. Possibilities:
    * Three rows    [X X X] or [O O O]
    * Three cols    [X X X] or [O O O]
    * Two diagonals [X X X] or [O O O]
    :param state: the state of the current board
    :param player: a human or a computer
    :return: True if the player wins
    """

    # duyệt theo rows
    for row_index in range(0, BOARD_SIZE):
        current_row = state[row_index]
        # kiểm tra xem các item có giá trị là player hay ko?
        # nếu 1 row chỉ chứa toàn HUMAN or COMP thì set chỉ có 1 item, vì set ko thể chứa item trùng lập
        if current_row[0] == player and len(set(current_row)) == 1:
            return True

        # sử dụng hàng thứ row_index để duyệt cột
        # duyệt theo cột

        col_set = set()
        for col_index in range(0, BOARD_SIZE):
            col_set.add(state[col_index][row_index])
        if state[col_index][row_index] == player and len(set(col_set)) == 1:
            return True

    # duyệt 2 đường chéo
    # chéo từ trái sang phải
    left_2_right_set = set()
    for index in range(0, BOARD_SIZE):
        left_2_right_set.add(state[index][index])
    if state[0][0] == player and len(set(left_2_right_set)) == 1:
        return True

    # chéo từ phải sang trái
    right_2_left_set = set()
    for index in range(0, BOARD_SIZE):
        right_2_left_set.add(state[BOARD_SIZE-index-1][index])
    if state[BOARD_SIZE - 1][0] == player and len(set(right_2_left_set)) == 1:
        return True

    return False
    # win_state = [
    #     [state[0][0], state[0][1], state[0][2]],
    #     [state[1][0], state[1][1], state[1][2]],
    #     [state[2][0], state[2][1], state[2][2]],
    #     [state[0][0], state[1][0], state[2][0]],
    #     [state[0][1], state[1][1], state[2][1]],
    #     [state[0][2], state[1][2], state[2][2]],
    #     [state[0][0], state[1][1], state[2][2]],
    #     [state[2][0], state[1][1], state[0][2]],
    # ]
    # if [player, player, player] in win_state:
    #     return True
    # else:
    #     return False


def game_over(state):
    """
    This function test if the human or computer wins
    :param state: the state of the current board
    :return: True if the human or computer wins
    """
    return wins(state, HUMAN) or wins(state, COMP)


def empty_cells(state):
    """
    Each empty cell will be added into cells' list
    :param state: the state of the current board
    :return: a list of empty cells
    """
    cells = []

    for x, row in enumerate(state):
        for y, cell in enumerate(row):
            if cell == 0:
                cells.append([x, y])

    return cells


def valid_move(x, y):
    """
    A move is valid if the chosen cell is empty
    :param x: X coordinate
    :param y: Y coordinate
    :return: True if the board[x][y] is empty
    """
    if [x, y] in empty_cells(board):
        return True
    else:
        return False


def set_move(x, y, player):
    """
    Set the move on board, if the coordinates are valid
    :param x: X coordinate
    :param y: Y coordinate
    :param player: the current player
    """
    if valid_move(x, y):
        board[x][y] = player
        return True
    else:
        return False


def minimax(board, depth, alpha, beta, player):
    if depth == 0 or game_over(board):
        return evaluate(board)

    if player == COMP:
        best_value = -infinity
        for cell in empty_cells(board):
            board[cell[0]][cell[1]] = player
            value = minimax(board, depth - 1, alpha, beta, HUMAN)
            board[cell[0]][cell[1]] = 0
            best_value = max(best_value, value)
            alpha = max(alpha, best_value)
            if beta <= alpha:
                break
        return best_value
    else:
        best_value = infinity
        for cell in empty_cells(board):
            board[cell[0]][cell[1]] = player
            value = minimax(board, depth - 1, alpha, beta, COMP)
            board[cell[0]][cell[1]] = 0
            best_value = min(best_value, value)
            beta = min(beta, best_value)
            if beta <= alpha:
                break
        return best_value


def find_best_move(board):
    best_value = -infinity
    best_move = None
    for cell in empty_cells(board):
        x, y = cell[0], cell[1]
        board[x][y] = COMP
        value = minimax(board, 4, -infinity, infinity, HUMAN)
        board[x][y] = 0
        if value > best_value:
            best_value = value
            best_move = cell
    return best_move


def clean():
    """
    Clears the console
    """
    os_name = platform.system().lower()
    if 'windows' in os_name:
        system('cls')
    else:
        system('clear')


def render(state, c_choice, h_choice):
    """
    Print the board on console
    :param state: current state of the board
    """

    chars = {
        -1: h_choice,
        +1: c_choice,
        0: ' '
    }
    str_line = '---------------'

    print('\n' + str_line)
    for row in state:
        for cell in row:
            symbol = chars[cell]
            print(f'| {symbol} |', end='')
        print('\n' + str_line)


def ai_turn(c_choice, h_choice):
    """
    It calls the minimax function if the depth < 9,
    else it choices a random coordinate.
    :param c_choice: computer's choice X or O
    :param h_choice: human's choice X or O
    :return:
    """
    depth = len(empty_cells(board))
    if depth == 0 or game_over(board):
        return

    clean()
    print(f'Computer turn [{c_choice}]')
    render(board, c_choice, h_choice)

    if depth == BOARD_SIZE*BOARD_SIZE:
        x = choice([0, 1, 2])
        y = choice([0, 1, 2])
    else:
        move = find_best_move(board)
        x, y = move[0], move[1]

    set_move(x, y, COMP)
    time.sleep(1)


def human_turn(c_choice, h_choice):
    """
    The Human plays choosing a valid move.
    :param c_choice: computer's choice X or O
    :param h_choice: human's choice X or O
    :return:
    """
    depth = len(empty_cells(board))
    if depth == 0 or game_over(board):
        return

    # Dictionary of valid moves
    move = -1
    moves = {
        1: [0, 0], 2: [0, 1], 3: [0, 2],
        4: [1, 0], 5: [1, 1], 6: [1, 2],
        7: [2, 0], 8: [2, 1], 9: [2, 2],
    }

    clean()
    print(f'Human turn [{h_choice}]')
    render(board, c_choice, h_choice)

    while move < 1 or move > BOARD_SIZE*BOARD_SIZE:
        try:
            move = int(input(f'Use numpad (1..{BOARD_SIZE*BOARD_SIZE}): '))
            # coord = moves[move]
            x = 0
            y = 0
            numpad_value = 0
            flag = False
            for i in range(0, BOARD_SIZE):
                if flag:
                    break
                for j in range(0, BOARD_SIZE):
                    numpad_value = numpad_value+1
                    if numpad_value == move:
                        x = i
                        y = j
                        break

            can_move = set_move(x, y, HUMAN)

            if not can_move:
                print('Bad move')
                move = -1
        except (EOFError, KeyboardInterrupt):
            print('Bye')
            exit()
        except (KeyError, ValueError):
            print('Bad choice')


def main():
    """
    Main function that calls all functions
    """
    clean()
    h_choice = ''  # X or O
    c_choice = ''  # X or O
    first = ''  # if human is the first

    # Human chooses X or O to play
    while h_choice != 'O' and h_choice != 'X':
        try:
            print('')
            h_choice = input('Choose X or O\nChosen: ').upper()
        except (EOFError, KeyboardInterrupt):
            print('Bye')
            exit()
        except (KeyError, ValueError):
            print('Bad choice')

    # Setting computer's choice
    if h_choice == 'X':
        c_choice = 'O'
    else:
        c_choice = 'X'

    # Human may starts first
    clean()
    while first != 'Y' and first != 'N':
        try:
            first = input('First to start?[y/n]: ').upper()
        except (EOFError, KeyboardInterrupt):
            print('Bye')
            exit()
        except (KeyError, ValueError):
            print('Bad choice')

    # Main loop of this game
    while len(empty_cells(board)) > 0 and not game_over(board):
        if first == 'N':
            ai_turn(c_choice, h_choice)
            first = ''

        human_turn(c_choice, h_choice)
        ai_turn(c_choice, h_choice)

    # Game over message
    if wins(board, HUMAN):
        clean()
        print(f'Human turn [{h_choice}]')
        render(board, c_choice, h_choice)
        print('YOU WIN!')
    elif wins(board, COMP):
        clean()
        print(f'Computer turn [{c_choice}]')
        render(board, c_choice, h_choice)
        print('YOU LOSE!')
    else:
        clean()
        render(board, c_choice, h_choice)
        print('DRAW!')

    exit()


if __name__ == '__main__':
    main()
