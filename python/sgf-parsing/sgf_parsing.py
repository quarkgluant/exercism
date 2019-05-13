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

def process_node(node_stack):
    res = {}
    node = r''.join(node_stack)
    value_pattern = r'(?P<value>(\\]|[\w\s])+'
    node_pattern = re.compile(r"(?P<pairs>(?P<key>[A-Z]{1,2})(?P<values>(\[(?P<value>(\\.|[\w\s])+\]))+))")
    if not node_pattern.match(node):
        raise ValueError("incorrect format")
    for matches in node_pattern.finditer(node):
        key = matches.group('key')
        values = []
        m = matches.group('values')
        for index, value in enumerate(m):
            if value == ']' and m[index - 1] == '\\':
                values.append(r']')
            if (value != r']' and m[index - 1] != r'\\') and value != r'[' :
                values.append(value)
        # values = [value for value in matches.group('values') if value != r']' and value != r'[']
        if ']' in values:
            values = ''.join(values)
            values = [values.replace('\\', '').replace('\t', ' ')]
        print(f"in process_node: key: {key}, values: {values}")
        res.update(dict([(key, values)]))
    print(f"res: {res}")
    return res

def parse(input_string):
    if len(input_string) < 3:
        raise ValueError("not valid input")

    tree = []
    variation = []
    node = []
    print(f'  >>>> input string: r{input_string}')
    # top_pattern = re.compile(r'\(;(?P<node>(?P<pairs>((?P<key>[A-Z]{1,2})(?P<values>(\[(?P<value>\w+)\])+)+)+)+)+')
    # matches = top_pattern.match(input_string)
    # if matches:
    #     print(f"  node: {matches.group('node')}")
    #     print(f"  key: {matches.group('key')}")
    #     print(f"  pairs: {matches.group('pairs')}")
    #     print(f"  values: {matches.group('values')}")
    #     # print(f"  value: {matches.group('value')}")
    if input_string == '(;)':
        return SgfTree()
    for index, char in enumerate(input_string):
        if char == '(':
            if input_string[index + 1] != ';':
                raise ValueError("not valid input, missing ;")
            if node:
                variation.append(''.join(node))
                node = []
            if variation:
                tree.append(variation)
                variation = []

        elif char == ';':
            if node:
                variation.append(r''.join(node))
                node = []
        elif char == ')':
            if node:
                variation.append(''.join(node))
                node = []
            if variation:
                tree.append(variation)
                variation = []
        else:
            node.append(char)
    print(f"et à la fin tree: {tree}")
    for stack in tree:
        print(f"  >> stack: {stack}")
    return process_tree(tree)

def process_tree(tree):
    index_root = 1
    children = []
    head = tree[0][0]
    tail = tree[index_root:][0:]
    if tree:
        if head:
            father = process_node(head)
        while tree[0][index_root:]:
            children.append(SgfTree(process_node(tree[0][index_root:])))
            index_root += 1
    root = SgfTree(properties=father, children=children)
    if not tail:
        res = root
    else:
        siblings = []
        for item in tail:
            siblings.append(SgfTree(properties=process_node(item)))
        res = SgfTree(properties=father, children=siblings)
    print(f"en toute fin: {res}")
    return res

