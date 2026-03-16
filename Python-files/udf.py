@outputSchema('num:long')
def get_length(data):
    str_data=''.join([chr(x) for x in data])
    return len(str_data)
