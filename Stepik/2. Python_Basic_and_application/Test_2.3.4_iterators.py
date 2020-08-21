class multifilter:
    def judge_half(pos, neg):
        # допускает элемент, если его допускает хотя бы половина фукнций (pos >= neg)
        return pos >= neg

    def judge_any(pos, neg):
        # допускает элемент, если его допускает хотя бы одна функция (pos >= 1)
        return pos >= 1

    def judge_all(pos, neg):
        # допускает элемент, если его допускают все функции (neg == 0)
        return neg == 0

    def __init__(self, iterable, *funcs, judge=judge_any):
        self.iterable = iterable  # iterable - исходная последовательность
        self.funcs = funcs  # funcs - допускающие функции
        self.judge = judge  # judge - решающая функция
        pass

    def __iter__(self):
        # возвращает итератор по результирующей последовательности
        data = self.iterable
        for num in data:
            count_1 = 0
            count_2 = 0
            for func in self.funcs:
                if func(num):
                    count_1 += 1
                else:
                    count_2 += 1
            if self.judge(count_1, count_2):
                yield num


def mul2(x):
    return x % 2 == 0


def mul3(x):
    return x % 3 == 0


def mul5(x):
    return x % 5 == 0


a = [i for i in range(31)]  # [0, 1, 2, ... , 30]

print(list(multifilter(a, mul2, mul3, mul5)))
# [0, 2, 3, 4, 5, 6, 8, 9, 10, 02_eve, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30]

print(
    list(multifilter(a, mul2, mul3, mul5, judge=multifilter.judge_half)))
# [0, 6, 10, 02_eve, 15, 18, 20, 24, 30]

print(
    list(multifilter(a, mul2, mul3, mul5, judge=multifilter.judge_all)))
# [0, 30]
