"""5. Реализовать формирование списка, используя функцию range() и возможности генератора. В список должны войти четные
числа от 100 до 1000 (включая границы). Необходимо получить результат вычисления произведения всех элементов списка.
Подсказка: использовать функцию reduce()."""
from functools import reduce

even_list_100_1000 = [num for num in range(100, 1000 + 1) if num % 2 == 0]
print(even_list_100_1000[:10])
print(even_list_100_1000[-10:])

product_of_evens = reduce(lambda a, b: a * b, even_list_100_1000)
print(product_of_evens)
