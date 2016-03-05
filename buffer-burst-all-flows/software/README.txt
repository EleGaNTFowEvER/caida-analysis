Software description:

file: find-max-packets-flow-in-burst-ts-in-us.py

The definition of a burst is:
If there is a train of packets (p1,p2,p3,....pn)
then p1 and p2 are in the same burst iff:
(timestamp of p2) - [(time stamp of p1) + (length(p1) in bits)/NIC rate(bps)] < delta

Assuming a 10Gbps link packet inter-arrival times for two back-to-back packets is 1.2us for a 1500B packet.
The value of delta chosen is 1us for burst analysis.

The headers in the output are:
cumPktCount,burstNum,burstSize,pktsBurst,pktsFlow,maxBytesFlow,fractionFlowBytes
where

burstNum: The n'th burst

burstSize: Size of the burst or STF in bytes contributed by packets of all flows, appearing in that burst

pktsBurst: Number of packets from all flows in that burst

pktsFlow: Number of packets for a particular flow with the most number of bytes transferred, appearing in the burst.

maxBytesFlow: Bytes carried by pktsFlow, or the specific flow, which transferred the maximum number of bytes in that burst.

fractionFlowBytes: ratio of maxBytesFlow to burstSize

cumPktCount: (cumPktCount - pktsBurst) gives the packet number which starts the current burst and cumPktCount is the last packet number of the burst.





Filename: find-max-flow-size-in-burst-ts-in-ns.py, FilePath: caida-analysis/buffer-burst-all-flows/software

The headers in the output are:
burstLastPacketId,burstId,burstSize,pktsInBurst,pktsFlow,maxBytesFlow,fractionFlowBytes
cumPktCount,burstNum,burstSize,pktsBurst,pktsFlow,maxBytesFlow,fractionFlowBytes

where:


burstLastPacketId: the packet Id of the last packet in this burst

burstId: the Id of this burst, and they are consequent

burstSize: Size of the burst or STF in bytes contributed by packets of all flows, appearing in that burst

pktsBurst: Number of packets from all flows in that burst

pktsFlow: Number of packets for a particular flow with the most number of bytes transferred, appearing in the burst.

maxBytesFlow: Bytes carried by pktsFlow, or the specific flow, which transferred the maximum number of bytes in that burst.

fractionFlowBytes: ratio of maxBytesFlow to burstSize

What to find:
1) Find the maximum burst size and then look for the maxBytesFlow, or the maximum number of bytes a single flow has in the burst.
(sort in descending order of burstSize (find the top 10 bursts), and then sort in descending order of maxBytesFlow lets say among the top 10 entries

2) A  burstSize is only significant if it is close to 125 MBytes, as most router buffers are in that range. However, there is a very slight chance that we would find
such a huge burst size. Let's say we want to look at burst size which can cause a delay of 10ms on a 10Gbps link ~ 10ms * 10Gbps = 125 MB. The largest burst size we 
may find could be in few 10's of MB.


Result description:
burst_minute1_delta10ns.txt:   the result of setting delta as 10ns, with 34686314 bursts
burst_minute1_delta30ns.txt:   the result of setting delta as 30ns, with 33463736 bursts and maximal burst size is 2367.0
burst_minute1_delta100ns.txt:  the result of setting delta as 100ns, with 24670950 bursts and maximal burst size is 17112.0

The input file has 34687621 packets.

