
global population;
global Generations;
global FunctionValue;
global num_population;
global FrontValue;


FunctionValue = objective();  %����Ŀ����������ֵ
FrontValue = NonDominateSort(FunctionValue,0); % ���з�֧������
CrowdDistance = CrowdDistances(FunctionValue,FrontValue);%����ۼ�����

if draw_iteration_flag ~= 0
    figure2=figure();
    scatter3(FunctionValue(:,1),FunctionValue(:,2),FunctionValue(:,3));
    xlabel('f1','FontSize',16);
    ylabel('f2','FontSize',16);
    zlabel('f3','FontSize',16);
end


%��ʼ����
for Gene = 1 : Generations
    %�����Ӵ���
    MatingPool = Select(population,FrontValue,CrowdDistance); %�����ѡ��2�Ľ�����ѡ��ʽ
    Offspring = Cross_mutation(MatingPool); %����,���죬Խ�紦�������µ���Ⱥ
    
    population = [population;Offspring];  %��Ⱥ�ϲ�
    
    FunctionValue = objective();%����Ŀ�꺯��ֵ
    [FrontValue,MaxFront] = NonDominateSort(FunctionValue,1); % ���з�֧������
    CrowdDistance = CrowdDistances(FunctionValue,FrontValue);%����ۼ�����
    
    
    %ѡ����֧��ĸ���
    Next = zeros(1,num_population);
    NoN = numel(FrontValue,FrontValue<MaxFront);
    Next(1:NoN) = find(FrontValue<MaxFront);
    
    %ѡ�����һ����ĸ���
    Last = find(FrontValue==MaxFront);
    [~,Rank] = sort(CrowdDistance(Last),'descend');
    Next(NoN+1:num_population) = Last(Rank(1:num_population-NoN));
    
    %��һ����Ⱥ
    population = population(Next,:);
    FrontValue = FrontValue(Next);
    CrowdDistance = CrowdDistance(Next);
    FunctionValue = objective();
    
    %���Ƶ���ͼ
    if draw_iteration_flag ~= 0
        figure(figure2);
        scatter3(FunctionValue(:,1),FunctionValue(:,2),FunctionValue(:,3));
        title(['λ�õ���������', num2str(Gene)]);
    end
end

