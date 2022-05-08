import pyencoder

lists = list()
lists.append([0.35, 1, [1,2,3], 10])
lists.append([0.876, 2, [1,2], 8])
lists.append([1.5, 4, [1], 20])
lists.append([1, 'hogehoge'])
lists.append([10,'foofoo'])
lists.append([0.7, [[1,2,3], [4,5,6]], [1], 10])

encoded_str = pyencoder.encode_list(lists)
print(encoded_str)

decoded_list = pyencoder.decode_list(encoded_str)
print(decoded_list)