import sys
import pandas as pd
import matplotlib.pyplot as plt

filename = sys.argv[1]

df = pd.read_csv(filename, sep=';')

# df['nslaves']= df.iloc[:, 2:4].sum(axis=1)
# df['ms']= df['latency'] / 1000

pieces = df.shape[0] / 50
buffersizes = ['4096', '8192', '16384', '32768', '65536']
data = {'4096':[], '8192':[], '16384':[], '32768':[], '65536':[]}

for i in range(0, int(pieces)):
    slaves = df['nioclusters'][i * 50] + df['ncclusters'][i * 50]
    ms = df['latency'][i*50 : (i+1)*50].mean() / 1000

    data[str(df['buffersize'][i * 50])].append([slaves, ms])

for size in buffersizes:
    df_mean = pd.DataFrame(data[size], columns=['nslaves', 'ms'])

    titlename = df['abstraction'][0] + " " + df['kernel'][0] + " " + size
    ax = df_mean.plot.bar(x='nslaves', y='ms', rot=0, title=titlename)
    plt.show()
