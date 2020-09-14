function [final_singe_FunctionValue, normalized_FuncationValue,weight] = mult_to_oneObjective(FunctionValue)
%�����ж�Ŀ��ת��Ϊ��Ŀ�꺯����ֵ
%result      ��������
%normalized_FuncationValue   ��һ������

normalized_FuncationValue = zeros(size(FunctionValue,1),size(FunctionValue,2));
min_value = min(FunctionValue);
max_value = max(FunctionValue);
final_singe_FunctionValue = 0;
for i = 1:3
    normalized_FuncationValue(:,i) = (FunctionValue(:,i)-min_value(i))/(max_value(i) - min_value(i));
end
weight = calculate_weight(normalized_FuncationValue);

for i = 1:3
    final_singe_FunctionValue = final_singe_FunctionValue+ weight(i) .* ( normalized_FuncationValue(:,i)).^2;
end

final_singe_FunctionValue = sqrt(final_singe_FunctionValue);

end