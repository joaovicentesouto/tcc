# Experiments

- Connectors: Mailbox, Portal
- Patterns: Ping-Pong, Broadcast, Scatter, Gather, All Gather
- Compute Clusters: 2, 4, 8, 16
- IO Clusters: 1, 2

### Mailbox
- Size: MAILBOX_MSG_SIZE
- Sender: Compute Cluster
- Receiver: IO Cluster

### Portal
- Size: 4 KB, 8 KB, 16 KB, 32 KB, 64 KB
- Sender: IO Cluster
- Receiver: Compute Cluster

# Useful Links

- [MPI patterns](https://mpitutorial.com/tutorials/mpi-scatter-gather-and-allgather/)