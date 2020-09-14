%bus_traffic_optimation entry
%clear; close all;clc;  %��������ݿ��ڵ�һ�����к󣬼��ټ�������ʱ�䣬�Ӷ��ӿ�����
format compact;

global num_population;
global Generations;
global speed;
global frequency;
global t_k;
global t_g;
global ProC;
global ProM;
global population;
global FunctionValue;
global draw_iteration_flag;
global num_flag;
global FrontValue;

%��������
draw_routeMap_flag=0;   %�Ƿ����---���к�ѡ��·ͼ---,Ϊ0Ϊ������
draw_iteration_flag=0;  %�Ƿ����---����Ŀ��ֵ����ͼ---��Ϊ0Ϊ������
num_flag = 3;           %������·�������ɷֱ�����Ϊ1��2��3
num_population = 50;    %��Ⱥ��,Ϊ���ڽ�����ԣ���Ⱥ��Ϊż��
Generations = 20;       %��������
ProC = 0.8;             %�������
ProM = 0.3;             %�������
speed=20;               %���������ٶ�
frequency=3;            %���巢��Ƶ����ʱ�䣻
t_k=18+[11/60,31/60,51/60];       %��������ʱ���
t_g = 18+[5/60,11.5/60 18/60 24.4/60 31/60 ... %������վʱ���
    37.5/60 44/60 50.5/60 57/60];



load_excel_data;            %��ʼ������
initial_candidate_routes;   %��ʼ����ѡ��·
if draw_routeMap_flag ~= 0
    figure1 = draw_routeMap();
end
if num_flag==1
    population = eye(13);
    FunctionValue = objective;
    [FrontValue,~] = NonDominateSort(FunctionValue,1); % ���з�֧������
elseif num_flag==2 || num_flag==3
    population = false(num_population,13);
    for pop_index = 1:num_population
        temp_x = false(1,13);
        temp_x(randperm(13,num_flag))=1;
        while domain_limit(temp_x)==0
            temp_x = false(1,13);
            temp_x(randperm(13,num_flag))=1;
        end
        population(pop_index,:) = temp_x;
    end
    NSGA_II;
else
    error("num_flag����Ϊ1��2��3");
end
show_result();%����������ʾ���

answer = questdlg('�Ƿ����·��ʾ�þ�?','','��','��','��');
if answer =='��'
   route_tool; 
end


