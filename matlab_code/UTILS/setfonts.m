% Copyright (c) 2022, Politecnico di Milano (PoliMi)
% Author: Alberto Icardi <alberto.icardi97@gmail.com>
function setfonts
% Set fonts for figures and other default settings
%
set(0,'defaultFigurePaperType','a4')
set(0,'defaultAxesBox','on')
set(0,'defaultAxesFontName','Arial')
set(0,'defaultAxesFontWeight','normal')
set(0,'defaultAxesFontSize',18)
set(0,'defaultAxesLineWidth',2)
set(0,'defaultAxesTickDir','out')
set(0,'defaultTextFontName','Arial')
set(0,'defaultTextFontWeight','normal')
set(0,'defaultTextFontSize',20)
set(0,'defaultLineLineWidth',3)
set(0,'defaultLineMarkerSize',8)
%set(0,'defaultLineMarkerEdgeColor','k')
ColorOrder = [0 0 1; 0 0 0; 1 0 0; 0.5 0.5 0.5];
set(0,'defaultAxesColorOrder',ColorOrder)
set(0,'defaultRectangleLineWidth',2)

return
