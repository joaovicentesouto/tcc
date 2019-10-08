import sys
import pandas as pd

filename = sys.argv[1]

df = pd.read_csv(filename, sep=';')

data = []

if df['kernel'][0] == 'pingpong':
    for index, row in df.iterrows():
        data.append([row['abstraction'], row['kernel'], 1, 1, row['volume'], row['latency'], row['volume']])

elif df['kernel'][0] == 'allgather':
    limit = df.shape[0] / 2

    for index, row in df.iterrows():
        if index < limit:
            data.append([row['abstraction'], row['kernel'], 1, (row['slaves'] - 1), int(row['volume'] / (row['slaves'] - 1)), row['latency'], row['volume']])
        else:
            data.append([row['abstraction'], row['kernel'], 2, (row['slaves'] - 2), int(row['volume'] / (row['slaves'] - 1)), row['latency'], row['volume']])

else:
    limit = df.shape[0] / 2

    for index, row in df.iterrows():

        buffersize = row['volume']
        if row['kernel'] == 'gather':
            buffersize = int(row['volume'] / row['slaves'])

        if index < limit:
            data.append([row['abstraction'], row['kernel'], 0, (row['slaves']), buffersize, row['latency'], row['volume']])
        else:
            if row['abstraction'] == 'portal' and row['kernel'] == 'broadcast':
                break

            if row['abstraction'] == 'portal' and row['kernel'] == 'sather':
                break

            data.append([row['abstraction'], row['kernel'], 1, (row['slaves'] - 1), buffersize, row['latency'], row['volume']])


df = pd.DataFrame(data, columns=['abstraction', 'kernel', 'nioclusters', 'ncclusters', 'buffersize', 'latency', 'volume'])

filename = filename.replace("raw/", "cooked/").replace(".raw", ".csv")
df.to_csv(filename, sep=';', index=False)