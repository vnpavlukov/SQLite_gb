def s(a, *vs, b=10):
    res = a + b
    for v in vs:
        res += v
    return res


# print(s(b=31, 0))
print(s(5, 5, 5, 5, 1))
# print(s(b=31))
print(s(0, 0, 31))
print(s(21))
print(s(11, b=20))
print(s(11, 10, b=10))
print(s(11, 10, 10))
print(s(11, 10))
