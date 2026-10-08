%%
source = 'RV1ROFA';
target = 'RFFA';

file_name = ['synergy_result_list_' source '_to_' target '_50ms.mat'];
save_name =['synergy_result_' source '_to_' target '_50ms.mat'];

subj_list=1:21;
time_point=4140;
load(file_name)
Monney_result = zeros(time_point,length(subj_list));
Normal_result = zeros(time_point,length(subj_list));
Monney_uni_s1_reslut=zeros(time_point,length(subj_list));
Monney_uni_s2_reslut=zeros(time_point,length(subj_list));

Normal_uni_s1_reslut=zeros(time_point,length(subj_list));
Normal_uni_s2_reslut=zeros(time_point,length(subj_list));


Monney_red = zeros(time_point,length(subj_list));
Normal_red = zeros(time_point,length(subj_list));
Time=(1/1200:1/1200:(1/1200)*time_point);
Time=Time-(1-(3.5-max(Time)));

for i=1:length(subj_list)
    Monney_result(:,i) = Monney_synergy(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);
    Normal_result(:,i) = Normal_synergy(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);
    
    Monney_red(:,i) = Monney_share_s12(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);
    Normal_red(:,i) = Normal_share_s12(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);
    
    Monney_uni_s1_reslut (:,i) = Monney_uni_s1(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);
    Monney_uni_s2_reslut(:,i)  = Monney_uni_s2(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);

    Normal_uni_s1_reslut (:,i) = Normal_uni_s1(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);
    Normal_uni_s2_reslut (:,i) = Normal_uni_s2(1,(subj_list(i)-1)*time_point+1:subj_list(i)*time_point);

end

Monney_syn_red=Monney_result-Monney_red;
Normal_syn_red=Normal_result-Normal_red;


%%
mean_monney_synergy = [];
err_monney_synergy =[];
mean_normal_synergy = [];
err_normal_synergy =[];

mean_monney_red = [];
err_monney_red =[];
mean_normal_red = [];
err_normal_red =[];

mean_monney_uni_s1 = [];
err_monney_uni_s1 =[];
mean_normal_uni_s1= [];
err_normal_uni_s1 =[];

mean_monney_uni_s2 = [];
err_monney_uni_s2 =[];
mean_normal_uni_s2 = [];
err_normal_uni_s2 =[];

mean_monney_syn_red = [];
err_monney_syn_red =[];
mean_normal_syn_red = [];
err_normal_syn_red =[];
for i=1:time_point
    
    
    mean_monney_synergy = mean(Monney_result,2);
    
    err_monney_synergy = std(Monney_result')'/sqrt(21);
    
    mean_monney_uni_s1=mean(Monney_uni_s1_reslut,2);
    err_monney_uni_s1 = std(Monney_uni_s1_reslut')'/sqrt(21);
    
    mean_monney_uni_s2=mean(Monney_uni_s2_reslut,2);
    err_monney_uni_s2 = std(Monney_uni_s2_reslut')'/sqrt(21);

    mean_normal_synergy = mean(Normal_result,2);
    err_normal_synergy = std(Normal_result')'/sqrt(21);
    
    
    mean_normal_uni_s1=mean(Normal_uni_s1_reslut,2);
    err_normal_uni_s1 = std(Normal_uni_s1_reslut')'/sqrt(21);
    
    mean_normal_uni_s2=mean(Normal_uni_s2_reslut,2);
    err_normal_uni_s2 = std(Normal_uni_s2_reslut')'/sqrt(21);
    
    
    
    mean_monney_red = mean(Monney_red,2);
    
    err_monney_red = std(Monney_red')'/sqrt(21);
    mean_normal_red = mean(Normal_red,2);
    
    err_normal_red = std(Normal_red')'/sqrt(21);
    
    
    mean_monney_syn_red = mean(Monney_syn_red,2);
    err_monney_syn_red =std(Monney_syn_red')'/sqrt(21);
    mean_normal_syn_red = mean(Normal_syn_red,2);
    err_normal_syn_red =std(Normal_syn_red')'/sqrt(21);
    
    
end


save(save_name,'mean_monney_synergy','err_monney_synergy','mean_normal_synergy','err_normal_synergy',...
    'mean_monney_red','err_monney_red','mean_normal_red','err_normal_red'...
    ,'mean_monney_syn_red','err_monney_syn_red','mean_normal_syn_red','err_normal_syn_red'...
    ,'h_value_red','h_value_syn','h_value','h_value_Monney_red','h_value_Normal_red'...
    ,'h_value_Monney_syn','h_value_Normal_syn','h_value_Monney_syn_red','h_value_Normal_syn_red')




