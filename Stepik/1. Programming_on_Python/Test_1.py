i = 0
while i < 5:
    print('*', end='')
    if i % 2 == 0:
        print('**', end='')
    if i > 2:
        print('***', end='')
    i = i + 1

x = len('*****************')
print('\n', x)
