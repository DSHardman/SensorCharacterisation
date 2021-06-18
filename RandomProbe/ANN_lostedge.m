function [Y,Xf,Af] = ANN_lostedge(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 18-Jun-2021 15:43:59.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx6 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx2 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-4.99999999999909;-42.0000000000002;-38;-8.99999999995487;-10.9999999999845;-7.99999999996135];
x1_step1.gain = [0.0689655172413826;0.00782778864970649;0.0402588701678506;0.0930232558141645;0.0754716981131719;0.0885110709979152];
x1_step1.ymin = -1;

% Layer 1
b1 = [-122.47447674706626231;-3.3187895417950570298;-0.30052892793459351495;-26.960960336944445714;26.573732331045558652;-1.9071493483598782603;-17.13337900135948999;0.01427712836648593886;-0.2001286114610072997;-3.1779140298977850421];
IW1_1 = [0.2742107180381857523 -171.95471608507469341 7.2422279859949094671 -0.84070132107782202802 -1.370822556685009852 -0.23757079408307962831;0.55715998656791554389 -7.3176766758763296394 -1.3401723105903484701 -0.27156003606885648072 0.95781772908906082087 1.6440361812300230415;0.085754039529625597504 -0.10946097324281384155 0.046675460970463940324 4.3334628885445409807 -5.8554547532593312908 -0.12569984473527440194;-0.078655600570427530727 -39.840638147924750001 -1.3147697951531429617 -2.9013789494330097796 -0.38526305794919263326 -0.14466248029003930808;0.064279431159608255153 39.31909885521166359 1.2572716545473299199 2.9236051052652745064 0.39489739128237333343 0.14423678804538211939;-13.03861430756057338 35.073899073823717742 8.494021232921307174 10.237783066377062369 15.823485217991390073 11.638469046248911098;-17.55707211007927171 22.165691141373194739 47.570064966948997665 -0.88855990310571730806 -1.4222359395272834437 2.6510959865505623334;-0.32941898026043059389 1.117878968631493164 0.18358751311401511064 4.9638663112955514478 0.22486035380364863268 -2.2258073300052938492;0.07331950420312167982 -0.077873219942377280844 0.045379226995792186494 4.1597431268935238791 -5.8340170097121317738 -0.15899431889442799948;1.7601247081893642843 -8.0419985842152286182 -1.1075119631325720526 -0.30075440607161579853 0.91442133264208014243 1.6625622053113351395];

% Layer 2
b2 = [-0.53276514711272582314;0.39175326865521298281];
LW2_1 = [-0.46839329577531296778 1.935984117369106805 -0.071120675527703500207 -11.674922846053805259 -11.860557992890093715 -0.10850781582490182098 0.15588711581421929586 0.072454470745270491139 0.043831245317666689409 -1.7032850154927634545;-0.13911533076764748262 0.17361791008739957398 10.7544334319314423 -4.0269589074708349585 -4.1358146622628870759 -0.059169343725990038163 0.05173451175491169951 0.39200608410524395708 -10.738317279971987261 -0.121514295076981374];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0800227111322119;0.0800226083770493];
y1_step1.xoffset = [10.0002462740323;10.0001033766689];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
    Y{1,ts} = Y{1,ts}';
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end