def star(func):
    def inner(*args, **kwargs):
        print('+' * 30)
        func(*args, **kwargs)
        print('+' * 39)

    return inner


def percent(func):
    def inner(*args, **kwargs):
        print('*' * 30)
        func(*args, **kwargs)
        print('*' * 39)

    return inner


@star
@percent
def printer(msg):
    print(msg)


printer('Hello')