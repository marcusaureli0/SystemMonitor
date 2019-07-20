clear;
clc;
close all;

% Os arquivos abaixo definem os caminhos das pastas que contem 
% arquivos de log.

% As informacoes desses arquivos representam a variacao do consumo de 
% recursos do computador/notebook quando submetido a um ataque DoS.
% O alvo desses ataques foi um servidor SIP instalado em uma maquna virtual. 
rate0Path = './SystemMonitorLogs/July 19 2019 - 000516/';
rate800Path = './SystemMonitorLogs/July 18 2019 - 235051/';
rate400Path = './SystemMonitorLogs/July 18 2019 - 234220/';
rate150Path = './SystemMonitorLogs/July 18 2019 - 233620/';
rate5Path = './SystemMonitorLogs/July 18 2019 - 232627/';

% Caminho que sera utilizado na execucao
dataPath = rate800Path;

% Preparacao dos arquivos para a leitura
mode = 'r';
timeFile = fopen (strcat(dataPath, 'time.log'), mode);
memoryPercentFile = fopen (strcat(dataPath, 'memoryPercent.log'), mode);
memoryUsedFile = fopen (strcat(dataPath, 'memoryUsedMB.log'), mode);
cpuFile = fopen (strcat(dataPath, 'cpu.log'), mode);
inNetworkFile = fopen (strcat(dataPath, 'inNetworkKB.log'), mode);
outNetworkFile = fopen (strcat(dataPath, 'outNetworkKB.log'), mode);
inPacketFile  = fopen (strcat(dataPath, 'inPacket.log'), mode);
outPacketFile = fopen (strcat(dataPath, 'outPacket.log'), mode);

% Obtem as mensagens a serem exibidas no grafico
prop = PropertyManager('messages.properties');
timeAxis = prop.getProperty('timeAxis');
cpuTitle = prop.getProperty('cpuTitle');
cpuAxis = prop.getProperty('cpuAxis');
memoryUsedTitle = prop.getProperty('memoryUsedTitle');
memoryUsedAxis = prop.getProperty('memoryUsedAxis');
memoryPercentTitle = prop.getProperty('memoryPercentTitle');
memoryPercentAxis = prop.getProperty('memoryPercentAxis');
inNetworkTitle = prop.getProperty('inNetworkTitle');
inNetworkAxis = prop.getProperty('inNetworkAxis');
outNetworkTitle = prop.getProperty('outNetworkTitle');
outNetworkAxis = prop.getProperty('outNetworkAxis');

% Faz a leitura do arquivo armazendo as informacoes em um array
scanMode = '%f';
time = fscanf(timeFile, scanMode);
cpu = fscanf (cpuFile, scanMode);
menUsed = fscanf(memoryUsedFile, scanMode);
menPerc = fscanf(memoryPercentFile, scanMode);
inNetwork = fscanf(inNetworkFile, scanMode);
outNetwork = fscanf(outNetworkFile, scanMode);

% Plota os graficos de acordo com os parametros passados
plotter  = FilePlotter();
plotter.showGraph(cpuTitle, timeAxis, cpuAxis, time, cpu);
plotter.showGraph(memoryUsedTitle, timeAxis, memoryUsedAxis, time, menUsed);
plotter.showGraph(memoryPercentTitle, timeAxis, memoryPercentAxis, time, menPerc);
plotter.showGraph(inNetworkTitle, timeAxis, inNetworkAxis, time, inNetwork);
plotter.showGraph(outNetworkTitle, timeAxis, outNetworkAxis, time, outNetwork);