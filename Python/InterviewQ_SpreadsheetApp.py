"""
Let's build a spreadsheet app. The spreadsheet should support 2 functions:

- `set_cell` - Given a cell ID and a value, set the cell to the value. Value can be either:
    - A number. E.g. `5`
    - An expression. E.g. `=A1+B1`
- `get_cell` - Given a cell ID, get the value of the cell
"""
# Here are some examples of how they would be used:
# set_cell("A1", "5")
# set_cell("B1", "6")
# set_cell("C1", "=A1+B1")

# assert get_cell("C1") == 11

# "ABC1"

# numbers are strings
# = +
from collections import defaultdict


class spreadsheet:

    def __init__(self):
        self.sheet = defaultdict(dict)

    def checkexp(self, cellid):
        pt1, pt2 = self.splitid(cellid)
        return self.sheet[pt1][pt2].find('=') != -1

    def splitid(self, cellid):
        stri = 0
        for i in range(len(cellid)):
            if cellid[i].isnumeric():
                stri = i
                break
        pt1 = cellid[:stri]
        pt2 = int(cellid[stri:])
        return pt1, pt2

    def checkexist(self, cellid):
        pt1, pt2 = self.splitid(cellid)
        return self.sheet[pt1][pt2] != None

    def set_cell(self, cellid, val):
        # read in the id and identify two parts char and number
        # corresponding cell (dictionary)
        # {"A": {1: .. }, "B": {1: }}

        pt1, pt2 = self.splitid(cellid)

        self.sheet[pt1][pt2] = val

    def eval(self, fcn):
        lofval = fcn[1:].split('+')
        sum = 0
        for id in lofval:
            pt1, pt2 = self.splitid(id)
            sum += int(self.sheet[pt1][pt2])
        return sum

    def get_cell(self, cellid):

        pt1, pt2 = self.splitid(cellid)
        # check if cell exists
        if self.checkexist(cellid):
            if self.checkexp(cellid):
                return self.eval(self.sheet[pt1][pt2])
            else:
                return self.sheet[pt1][pt2]
        else:
            print('no cell')


ss = spreadsheet()
ss.set_cell("A1", "5")
print(ss.get_cell("A1"))
ss.set_cell("B1", "6")
ss.set_cell("C1", "=A1+B1")
print(ss.get_cell("C1"))