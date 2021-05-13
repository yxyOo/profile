## 代码逻辑
1. 第一行的``top``,目的是获取表头
2. 若 ``top`` 显示的进程中有名为**testADSLab**的进程，执行3，
   否则，退出 
3. ``nvidia-smi``命令提区MEM和GPU占用
4. 打时间戳，单位是秒
5. ``sleep 5`` 后转2
## 启动方式（2种）
#### 方式一：直接启动
```shell
./testADSLab &> testADSLab.log &
```

#### 方式二：启动训练的同时启动
在**run_distribute_train_gpu.sh**中修改参数**profile**
**profile=1**表示启动test.sh脚本，训练结束时，测试脚本执行完毕退出
输出profilel文件位置：***train_parallel/testADSLab.log***
启动训练的命令：
```shell
 sh run_distribute_train_gpu.sh resnet50 cifar10 ~/dataset/cifar-10-batches-bin/
```
