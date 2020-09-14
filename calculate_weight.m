function weight_output = calculate_weight(normalized_value)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   weight_output  ���Ȩ��ֵ
%   normalized_value    �����һ���ľ���

f = (1+normalized_value)./repmat(sum(1+normalized_value),size(normalized_value,1),1);
H = -sum(f.*log(f))./log(size(f,1));
weight_output = (1-H)./sum(1-H);
end

