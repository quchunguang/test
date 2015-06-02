from SimpleXMLRPCServer import SimpleXMLRPCServer


def add(x, y):
    return x + y
if __name__ == '__main__':
    s = SimpleXMLRPCServer(('127.0.0.1', 8080))
    s.register_function(add)
    s.serve_forever()
