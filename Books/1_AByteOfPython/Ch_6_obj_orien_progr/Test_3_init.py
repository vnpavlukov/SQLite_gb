class Person:
    def __init__(self, name):
        self.name = name

    def say_hi(self):
        print('Hello! My name', self.name)

kolya = Person('Nikolai')
kolya.say_hi()