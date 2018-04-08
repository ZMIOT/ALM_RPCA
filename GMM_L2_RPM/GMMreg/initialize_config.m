function [config] = initialize_config(model, scene, motion)

config.model = model;
config.scene = scene;
config.motion = motion;
% estimate the scale from the covariance matrix
[n,d] = size(model);

%%%%%%%%%%%%%%����scale��С���൱�����÷���sigma��С���Ӵ�С����%%%%%%%%%
config.scale = power(det(model'*model/n), 1/(2^d)); %Ĭ��
config.scale = config.scale /20
%config.scale = 3.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

config.display = 0; %%��ʾ����ͼ
config.init_param = [ ];
config.max_iter = 1000;
config.normalize = 0;
switch lower(motion)
    case 'tps'
        interval = 5;
        config.ctrl_pts =  set_ctrl_pts(model, scene, interval); %%ȡ�������ڵ�interval*interval�����ص�
        config.alpha = 1;
        config.beta = 0;
        config.opt_affine = 1;
        [n,d] = size(config.ctrl_pts); % number of points in model set : n=25, d=2
        config.init_tps = zeros(n-d-1,d); %25-2-1=22�� 2��
        init_affine = repmat([zeros(1,d) 1],1,d); %[0 0 1 0 0 1]
        config.init_param = [init_affine zeros(1, d*n-d*(d+1))];% 2*25 - 2*��2+1�� = 44��0
        config.init_affine = [ ];
    otherwise
        [x0,Lb,Ub] = set_bounds(motion);
        %%%%%%%��x0���ó�ֵ,Ĭ��Ϊset_bounds���صĵ�λ��%%%%%%
        %��ֵ��ʽΪ[t1 t2 a11 a21 a12 a22];ע��������a12 a21��λ��
        %x0 =  [0    0   1   0  0  1] %%%����ֵ
        config.init_param = x0;
        config.Lb = Lb;
        config.Ub = Ub;
end

