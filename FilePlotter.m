classdef FilePlotter
   methods
       function obj = FilePlotter()
       end
       function showGraph(~, graphTitle, xLabel, yLabel, dataX, dataY)
            figure
            plot(dataX, dataY, '-gs',...
                'LineWidth',1,...
                'MarkerSize',4,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor',[0.2,0.2,0.2])
            grid
            title(graphTitle)
            xlabel(xLabel)
            ylabel(yLabel)
      end    
   end
end