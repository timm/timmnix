""" Supplies the internal functions for functools.py in the standard library """
try: from __pypy__ import builtinify
except ImportError: builtinify = lambda f: f


sentinel = object()

@builtinify
def reduce(func, sequence, initial=sentinel):
    """reduce(function, sequence[, initial]) -> value

Apply a function of two arguments cumulatively to the items of a sequence,
from left to right, so as to reduce the sequence to a single value.
For example, reduce(lambda x, y: x+y, [1, 2, 3, 4, 5]) calculates
((((1+2)+3)+4)+5).  If initial is present, it is placed before the items
of the sequence in the calculation, and serves as a default when the
sequence is empty."""
    iterator = iter(sequence)
    if initial is sentinel:
        try:
            initial = next(iterator)
        except StopIteration:
            raise TypeError("reduce() of empty sequence with no initial value")
    result = initial
    for item in iterator:
        result = func(result, item)
    return result


class partial(object):
    """
    partial(func, *args, **keywords) - new function with partial application
    of the given arguments and keywords.
    """
    def __init__(*args, **keywords):
        if len(args) < 2:
            raise TypeError('__init__() takes at least 2 arguments (%d given)'
                            % len(args))
        self, func, args = args[0], args[1], args[2:]
        if not callable(func):
            raise TypeError("the first argument must be callable")
        self._func = func
        self._args = args
        self._keywords = keywords

    def __delattr__(self, key):
        if key == '__dict__':
            raise TypeError("a partial object's dictionary may not be deleted")
        object.__delattr__(self, key)

    @property
    def func(self):
        return self._func

    @property
    def args(self):
        return self._args

    @property
    def keywords(self):
        return self._keywords

    def __call__(self, *fargs, **fkeywords):
        if self._keywords:
            fkeywords = dict(self._keywords, **fkeywords)
        return self._func(*(self._args + fargs), **fkeywords)

    def __repr__(self):
        cls = type(self)
        if cls is partial:
            name = 'functools.partial'
        else:
            name = cls.__name__
        tmp = [repr(self.func)]
        for arg in self.args:
            tmp.append(repr(arg))
        if self.keywords:
            for k, v in self.keywords.items():
                tmp.append("{}={!r}".format(k, v))
        return "{}({})".format(name, ', '.join(tmp))

    def __reduce__(self):
        d = dict((k, v) for k, v in self.__dict__.items() if k not in
                ('_func', '_args', '_keywords'))
        if len(d) == 0:
            d = None
        return (type(self), (self._func,),
                (self._func, self._args, self._keywords, d))

    def __setstate__(self, state):
        func, args, keywords, d = state
        if d is not None:
            self.__dict__.update(d)
        self._func = func
        self._args = args
        self._keywords = keywords
