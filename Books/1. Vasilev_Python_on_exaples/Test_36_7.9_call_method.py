class Box:
    def __init__(self, width, height, depth):
        print('Volume is:', self(width, height, depth))

    def __call__(self, width, height, depth):
        self.width = width
        self.height = height
        self.depth = depth
        volume = self.width * self.height * self.depth
        return volume


obj = Box(10, 20, 30)
print('New value:', obj(1, 2, 3))
