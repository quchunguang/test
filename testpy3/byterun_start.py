#!/usr/bin/python3
# https://linux.cn/article-7753-1-rel.html
# https://github.com/nedbat/byterun
# tested on python v3.5

# a = 1
# b = 2
# print(a + b)

# a friendly compiler transforms `s` into:
memory = {
    # Look on it as DNA ???
    "instructions": [("LOAD_VALUE", 0),
                     ("STORE_NAME", 0),
                     ("LOAD_VALUE", 1),
                     ("STORE_NAME", 1),
                     ("LOAD_NAME", 0),
                     ("LOAD_NAME", 1),
                     ("ADD_TWO_VALUES", None),
                     ("PRINT_ANSWER", None)],
    "numbers": [1, 2],
    "names": ["a", "b"]}


class Interpreter:
    def __init__(self):
        self.stack = []
        self.environment = {}

    def LOAD_VALUE(self, number):
        self.stack.append(number)

    def PRINT_ANSWER(self):
        answer = self.stack.pop()
        print(answer)

    def ADD_TWO_VALUES(self):
        first_num = self.stack.pop()
        second_num = self.stack.pop()
        total = first_num + second_num
        self.stack.append(total)

    def STORE_NAME(self, name):
        val = self.stack.pop()
        self.environment[name] = val

    def LOAD_NAME(self, name):
        val = self.environment[name]
        self.stack.append(val)

    def parse_argument(self, instruction, argument, memory):
        """ Understand what the argument to each instruction means."""
        numbers = ["LOAD_VALUE"]
        names = ["LOAD_NAME", "STORE_NAME"]
        if instruction in numbers:
            argument = memory["numbers"][argument]
        elif instruction in names:
            argument = memory["names"][argument]
        return argument

    def run_code(self, memory):
        instructions = memory["instructions"]
        for each_step in instructions:
            instruction, argument = each_step
            argument = self.parse_argument(instruction, argument, memory)
            bytecode_method = getattr(self, instruction)
            if argument is None:
                bytecode_method()
            else:
                bytecode_method(argument)


def main():
    interpreter = Interpreter()
    interpreter.run_code(memory)


if __name__ == '__main__':
    main()
