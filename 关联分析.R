
#关联分析
先把数据分类，改成虚拟变量，用yes no 代替1,0
变量多可以将每个变量的值直接改成几个类型
library(conjoint)
library(arules)
library(Matrix)
library(arulesViz)
apriori1<- read.table("clipboard",head=T)
apriori1N <- as(apriori1, "transactions")
rules <- apriori(apriori1N, parameter = list(support = 0.005, confidence = 0.8))
inspect(rules)
plot(rules,measure=c("support","confidence"),shading="lift")
plot(rules,method="group")#绘制散点图

####
rulesbuyyes <- subset(rules, subset = rhs %in% "岗位名称=no")#筛选
sort_rules<-sort(rules, by = "confidence")#lift、support
plot(sort_rules,measures=c("surpport","confidence"),shading="lift")
plot(sort_rules,method="group")
####

#关联分析可视化
library(arulesViz)
plot(rules,measure=c("support","lift"),shading="confidence")#散点图

plot(rules,measure=c("support","confidence"),shading="lift")
plot(rules,interactive=TRUE)#绘制互动散点图
plot(rules,method="group")#分组图 其他方法matrix、matrix3D、paracoord、graph
plot(rules,method="matrix")
plot(rules,method="matrix3D")
plot(rules,method="paracoord")
plot(rules, measure="confidence", method="graph", 
     control=list(type="items"), 
      shading = "lift")
#图形换色
library(RColorBrewer)
plot(rules,measure=c("support","confidence"),
       control=list(jitter=2,col = rev(brewer.pal(9, "Greens")[1：8])),
       shading="lift")
#散点图  jitter=2：增加抖动值,col: 调色板，默认是100个颜色的
灰色调色板,brewer.pal(n, name): 创建调色板：n表示该调色板内总共有多少种颜色；name表示调色板的名字



#保存图片
setwd("c://")
png(file="myplot1.png", bg="transparent")
plot(rules,method="group")
dev.off()
