import re

class SgfTree(object):
    def __init__(self, properties=None, children=None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other):
        if not isinstance(other, SgfTree):
            return False
        for k, v in self.properties.items():
            if k not in other.properties:
                return False
            if other.properties[k] != v:
                return False
        for k in other.properties.keys():
            if k not in self.properties:
                return False
        if len(self.children) != len(other.children):
            return False
        for a, b in zip(self.children, other.children):
            if a != b:
                return False
        return True

    def __ne__(self, other):
        return not self == other

    def __str__(self):
        return f"Sgftree(properties={self.properties}: children={self.children}"

def process_nodes(stack):
    brace_closing = re.compile(r'\)', re.MULTILINE)
    new_string = ''.join([item for item in stack])
    splits = brace_closing.split(new_string)
    print(f"process_nodes splits: {splits}")
    for node in splits:
        process_node(list(node))


def process_node(stack):
    # print(f"stack: {stack}")
    new_string = ''.join([item for item in stack])
    print(f"new_string: {new_string}")
    bracket_opening = re.compile(r'\[', re.MULTILINE)
    bracket_closing = re.compile(r'\]', re.MULTILINE)
    brace_closing = re.compile(r'\)', re.MULTILINE)

    splits = bracket_opening.split(new_string)
    # print(f"splits: {splits}")
    key, *others = splits
    pattern_key = re.compile('[A-Z]{1,3}')
    print(f"key: {key}, other: {others}")
    value = []
    if key != key.upper():
        raise ValueError("not valid input: invalid key")
    if len(others) == 0:
        raise ValueError("not valid input: property without delimiter")
    for item in others:
        print(f"item in others: {item}")
        if bracket_closing.match(item):
            process_node(list(item))
        else:
            item.strip(']')
            value.append(item.strip(']'))
            print(f"value: {value}")
    print(f"Sgftree: {SgfTree(properties={key: value})}")
    return SgfTree(properties={key: value})
    # if match_upper.group(1):
    #     key = match_upper.group(1)
    #     print(f"key: {key}")
    # else:
    #     raise ValueError("not valid input: invalid key")
    # print(f"new_string: {''.join(new_string)}")
    # pattern = re.compile('(?:([A-Z]{1,2})((\[[a-z\d]{1,4}\])+))+')
    # matches = pattern.findall(new_string)
    # print(f"groups: {matches}")
    # # if matches.group(0):


def parse(input_string):
    if len(input_string) < 3:
        raise ValueError("not valid input")

    # pattern = re.compile('\(?;')
    # input_list = pattern.split(input_string)
    # print(f"après découpage: {input_list}")
    # sub_pattern = re.compile('([A-Z]+(?:\[[a-z\d]+\])+\)*)')
    # pattern_spaces = re.compile('\s')
    #
    # for item in input_list[1:]:
    #
    #     item = pattern_spaces.sub('', item)
    #     print(f"item: {item}")
    #     matches = sub_pattern.search(item)
    #     if matches:
    #         print(f"matches group:{matches.group(0)}")
    #     else:
    #         raise ValueError("not valid input")
    # opening = set('([')
    # matches = set([('(', ')'), ('[', ']')])
    # stack_braces = []
    stack_nodes = []
    #
    # parser_char = {
    #     '(': opening_brace,
    #     '[': opening_bracket,
    #     ';': node,
    #     ')': closing_brace,
    #     ']': closing_bracket,
    # }
    #
    # second_index = 0
    # while second_index < len(input_size):
    print(f"  >>>> input string: {input_string}")
    top_pattern = re.compile(r'\(;(?P<node>(?P<pairs>((?P<key>[A-Z]{1,2})(?P<values>(\[(?P<value>\w+)\])+)+)+)+)+')
    matches = top_pattern.match(input_string)
    if matches:
        print(f"  node: {matches.group('node')}")
        print(f"  key: {matches.group('key')}")
        print(f"  pairs: {matches.group('pairs')}")
        print(f"  values: {matches.group('values')}")
        # print(f"  value: {matches.group('value')}")
    if input_string == '(;)':
        return SgfTree()
    for index, char in enumerate(input_string):
        if char == '(':
            if input_string[index + 1] != ';':
                raise ValueError("not valid input, missing ;")
            else:
                stack_node = []
                stack_nodes.append(stack_node)
        elif char == ';':
            if len(stack_node):
                return process_node(stack_node)
        elif char == ')':
            if len(stack_node):
                process_nodes(stack_node)
        else:
            stack_node.append(char)







