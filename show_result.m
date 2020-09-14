function show_result()
%��ʾ���

persistent msg_flag;
global population;
global FunctionValue;
global FrontValue;
global num_flag;
global candidate_route;
global frequency;

msg_flag = 0;

need1=find(FrontValue ==1);
pareto_population = population(need1,:);
pareto_FunctionN_Value = FunctionValue(need1,:);
[sorted_1_pareto_FunctionValue,ranked_1]  = sortrows(pareto_FunctionN_Value);
sorted_1_pareto_population = pareto_population(ranked_1,:);
disp(['-----------------------------','������·Ϊ',num2str(num_flag),'������Ƶ��Ϊ',num2str(frequency),'ʱ: ���---------------------------']);
disp('                  -----------pareto�⼯(����Ŀ�꺯��ֵf1����-----------               ');
for i=1:size(sorted_1_pareto_population,1)
    index = find(sorted_1_pareto_population(i,:)==1);
    switch num_flag
        case 1
            disp(['�� ',num2str(i),' ','����Ϊ:   ',...
                '��· ',num2str(index(1)),'    ',...
                '��Ŀ�꺯��ֵ��    ',num2str(-sorted_1_pareto_FunctionValue(i,1)),'      ',num2str(sorted_1_pareto_FunctionValue(i,2)),'      ',num2str(sorted_1_pareto_FunctionValue(i,3))]);
        case 2
            disp(['�� ',num2str(i),' ','����Ϊ:   ',...
                '��· ',num2str(index(1)),'    ',...
                '��· ',num2str(index(2)),'    ',...
                '��Ŀ�꺯��ֵ��    ',num2str(-sorted_1_pareto_FunctionValue(i,1)),'      ',num2str(sorted_1_pareto_FunctionValue(i,2)),'      ',num2str(sorted_1_pareto_FunctionValue(i,3))]);
        case 3
            disp(['�� ',num2str(i),' ','����Ϊ:   ',...
                '��· ',num2str(index(1)),'    ',...
                '��· ',num2str(index(2)),'    ',...
                '��· ',num2str(index(3)),'    ',...
                '��Ŀ�꺯��ֵ��    ',num2str(-sorted_1_pareto_FunctionValue(i,1)),'      ',num2str(sorted_1_pareto_FunctionValue(i,2)),'      ',num2str(sorted_1_pareto_FunctionValue(i,3))]);
    end
end

[final_singe_FunctionValue,normalized_FuncationValue,weight] = mult_to_oneObjective(sorted_1_pareto_FunctionValue);

disp('Ŀ�꺯����һ������(�����淽��һһ��Ӧ): ');
disp(char(num2str(normalized_FuncationValue)));
disp('��Ȩ������õ���Ȩ��ֵ��');
disp(char(num2str(weight)));
disp('Ŀ�꺯������(�����淽��һһ��Ӧ): ');
disp(char(num2str(final_singe_FunctionValue)));


[sorted_2_final_singe_FunctionValue,ranked_2] = sortrows(final_singe_FunctionValue);
sorted_2_pareto_FunctionValue = sorted_1_pareto_FunctionValue(ranked_2,:);
sorted_2_pareto_population = sorted_1_pareto_population(ranked_2,:);

num_sort = '';
num = '';
for i=1:size(sorted_2_pareto_population,1)
    num_sort = [num_sort,num2str(i),'           '];
    num = [num,num2str(ranked_2(i)),'           '];
end

disp('                 --------------����㷨��Ŀ�꣺���--------------               ');
disp('���з������Ϊ: ������ʾ��pareto�⼯�������');

disp(['����      ',num_sort]);
disp(['������ţ�  ',num]);
disp(['Ŀ��ֵ��С��',num2str(sorted_2_final_singe_FunctionValue')]);

aa = find(sorted_2_pareto_population(1,:)==1);    %��ȡ����ֵ�������·
route_str = cell(1,3);
for j=1:num_flag
    temp = candidate_route{aa(j)};
    route_str1 = '';
    for i=1:size(temp,2)
        if i==1
            route_str1 = [route_str1 , temp{i}];
        else
            route_str1 = [route_str1,'��',temp{i}];
        end
    end
    route_str{1,j}=route_str1;
end
switch num_flag
    case 1
        disp(['������·Ϊ�� ',num2str(aa(1)),' ��:  ',route_str{1}]);
    case 2
        disp(['���������·Ϊ�� ',' ����',num2str(ranked_2(1)),',  ��ѡ·�߷ֱ�Ϊ:']);
        disp(['       ',num2str(aa(1)),'  :  ',route_str{1}]);
        disp(['       ',num2str(aa(2)),'  :  ',route_str{2}]);
    case 3
        disp(['���������·Ϊ�� ',' ����',num2str(ranked_2(1)),',  ��ѡ·�߷ֱ�Ϊ:']);
        disp(['       ',num2str(aa(1)),'  :  ',route_str{1}]);
        disp(['       ',num2str(aa(2)),'  :  ',route_str{2}]);
        disp(['       ',num2str(aa(3)),'  :  ',route_str{3}]);
end
if msg_flag ~= 0
    helpdlg('��������������: route_tool ����ʾ��·��Ϣ','��ʾ');
end

end
