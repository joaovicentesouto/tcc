# import sys
# import pandas as pd
# import matplotlib.pyplot as plt

# CPU_FREQ = 400000000
# KB = 1024
# MB = 1024 * KB

# def plot_latency(df):

#     if df['kernel'][0] == 'pingpong':
#         pass
#     else:

#         without_io = int(df.shape[0] / 2)
#         pieces     = int(without_io / 40)

#         data = []
#         for i in range(0, pieces):
#             slaves = df['ncclusters'][i * 40]
#             ms = (df['latency'][i * 40 : (i + 1) * 40].mean() / slaves) * 1000000

#             data.append([slaves, ms])

#         df_mean = pd.DataFrame(data, columns=['nslaves', 'ms'])
#         titlename = df['abstraction'][0] + " " + df['kernel'][0] + " Without IO1 (slave)"
#         ax = df_mean.plot.bar(x='nslaves', y='ms', rot=0, title=titlename)
#         plt.show()

#         data = []
#         for i in range(0, pieces):
#             slaves = df['ncclusters'][without_io + i * 40] + 1
#             ms = (df['latency'][without_io + i * 40 : without_io + (i + 1) * 40].mean() / slaves) * 1000000

#             data.append([slaves, ms])

#         df_mean = pd.DataFrame(data, columns=['nslaves', 'ms'])
#         titlename = df['abstraction'][0] + " " + df['kernel'][0] + " With IO1 (slave)"
#         ax = df_mean.plot.bar(x='nslaves', y='ms', rot=0, title=titlename)
#         plt.show()

# def plot_throughput(df):

#     if df['kernel'][0] == 'pingpong':
#         pass
#     elif df['kernel'][0] == 'broadcast' or df['kernel'][0] == 'sather':

#         # # Transform
#         df['latency']    = df['latency'] / CPU_FREQ
#         # df['buffersize'] = df['buffersize'] / KB
#         df['buffersize'] = df['buffersize'].apply(lambda x: int(x / KB))
#         df['throughput'] = (df['volume'] / df['latency']) / MB

#         print(df[-10:-1])
#         return

#         offset = 14 * 40 * 5 + 1
#         data = []
#         for i in range(0, 5):
#             if df['ncclusters'][offset + i * 40] != 16:
#                 print("ERRRRRO")
#                 # continue

#             buffersize = df['buffersize'][offset + i * 40]
#             throughput = df['throughput'][offset + i * 5 : offset + (i + 1) * 5].mean()

#             data.append([buffersize, throughput])

#         df_mean = pd.DataFrame(data, columns=['buffersize', 'throughput'])
#         titlename = df['abstraction'][0] + " " + df['kernel'][0]
#         ax = df_mean.plot.bar(x='buffersize', y='throughput', rot=0, title=titlename)
#         plt.show()

# df = pd.read_csv(sys.argv[1], sep=';')

# if df['abstraction'][0] == 'mailbox':
#     plot_latency(df)
# else:
#     plot_throughput(df)