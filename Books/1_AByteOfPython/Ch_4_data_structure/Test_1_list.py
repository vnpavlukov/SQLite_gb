shoplist = ['яблоки', 'манго', 'морковь', 'бананы']

print('Я должен сделать', len(shoplist), 'покупки.')

print('Покупки:', end=' ')  # убирает \n, что бы следующий print не был с новой строки

for item in shoplist:
    print(item, end=' ')    # просто печатаем наш список покупок

print('\nТакже нужно купить риса.')
shoplist.append('рис')  # добавляет новый элемент в списоок

print('Теперь мой список покупок таков:', shoplist) # проверяем новый элемент в списке

print('Отсортирую-ка я свой список')
shoplist.sort()

print('Отсортированный список покупок выглядит так:', shoplist)

print('Первое, что мне нужно купить, это', shoplist[0]) # вывод на печать 1го элемента списка
olditem = shoplist[0]   # присваиваем переменной значение первого элемента
del shoplist[0]     # удаляем из списка первый элемент

print('Я купил', olditem)
print('Теперь мой список покупок:', shoplist)