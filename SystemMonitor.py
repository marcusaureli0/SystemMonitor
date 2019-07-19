import os
import psutil
import time
from datetime import datetime

def byteToKB(value):
    return value/1024

def byteToMB(value):
    return value/1024/1024

timeCount = 0
inPackets = 0
outPackets = 0
outBytes = 0
inBytes = 0
delay = 1

folderPath = os.getcwd() + "\SystemMonitorLogs\\" + str(datetime.now().strftime("%B %d %Y - %H%M%S"));
os.makedirs(folderPath)

# Nomes dos arquivos de log
timeFile = open (folderPath + "\\" + "time.log", "w")
memoryPercentFile = open (folderPath + "\\" + "memoryPercent.log", "w")
memoryUsedFile = open (folderPath + "\\" + "memoryUsedMB.log", "w")
cpuFile = open (folderPath + "\\" + "cpu.log", "w+")
inNetworkFile = open (folderPath + "\\" + "inNetworkKB.log", "w")
outNetworkFile = open (folderPath + "\\" + "outNetworkKB.log", "w")
inPacketFile  = open (folderPath + "\\" + "inPacket.log", "w")
outPacketFile = open (folderPath + "\\" + "outPacket.log", "w")

# Grava as informacoes de tempo, cpu, memoria, network e pacotes
# durante o tempo especificado
while timeCount <= 200:
    timeFile.write("%s\n" % str(timeCount))
    memoryPercentFile.write("%s\n" % str(psutil.virtual_memory()[2]))
    memoryUsedFile.write("%s\n" % str(byteToMB(psutil.virtual_memory()[3])))     
    cpuFile.write("%s\n" % str(psutil.cpu_percent()))
    inNetworkFile.write("%s\n" % str(byteToKB(inBytes)))
    outNetworkFile.write("%s\n" % str(byteToKB(outBytes)))
    inPacketFile.write("%s\n" % str(inPackets))
    outPacketFile.write("%s\n" % str(outPackets))
    
    inPackets = psutil.net_io_counters().packets_recv
    outPackets = psutil.net_io_counters().packets_sent
    outBytes = psutil.net_io_counters().bytes_sent
    inBytes = psutil.net_io_counters().bytes_recv
    
    time.sleep(delay)

    timeCount = timeCount + delay
    inPackets =  psutil.net_io_counters().packets_recv - inPackets
    outPackets = psutil.net_io_counters().packets_sent - outPackets
    outBytes = psutil.net_io_counters().bytes_sent - outBytes
    inBytes = psutil.net_io_counters().bytes_recv - inBytes

timeFile.close()
memoryPercentFile.close()
memoryUsedFile.close()
cpuFile.close()
inNetworkFile.close()
outNetworkFile.close()
inPacketFile.close()
outPacketFile.close()