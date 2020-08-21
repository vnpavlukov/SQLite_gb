from random import *


def rand_matrix(n, m):
    A = [[randint(0, 9) for j in range(m)] for i in range(n)]
    return A


def unit_matrix(n):
    A = [[int(i == j) for i in range(n)] for j in range(n)]
    return A


def mult_matrix(A, B):
    n = len(A)
    C = [[0 for i in range(n)] for j in range(n)]

    for i in range(n):
        for j in range(n):
            for k in range(n):
                C[i][j] += A[i][k] * B[k][j]

    return C


def show_matrix(A):
    for a in A:
        for b in a:
            print(b, end=' ')
        print()


seed(2014)
A = rand_matrix(3, 5)
print('Список:', A)
print('This matrix:')
show_matrix(A)

E = unit_matrix(4)
print('Unit matrix:')
show_matrix(E)

A1 = rand_matrix(3, 3)
A2 = rand_matrix(3, 3)
A3 = mult_matrix(A1, A2)

print('First matrix:')
show_matrix(A1)

print('Second matrix:')
show_matrix(A2)

print('Product matrix')
show_matrix(A3)