class Concat(object):

    def __init__(self, concat_symbol=''):
        self.symbol = concat_symbol

    def concat_all(self, *args):
        return self.symbol.join(args)
