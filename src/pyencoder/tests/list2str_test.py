import pathlib
import sys

path_tests = pathlib.Path(__file__).parent.resolve()
sys.path.append(str(path_tests)[0:-5])

import encoder

data = [[1,2,3,[4]], 'abc']

print(encoder.list2str(data))