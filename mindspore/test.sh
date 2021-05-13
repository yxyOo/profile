echo "`top -n 1 -b| sed -n 7p` "
echo "ada"
cpumem=`top -n 1 -b | grep -E "testADSLab"  `
while [ "$cpumem" != '' ]
do 
    echo -e "$cpumem"
    cputotal=`echo -e "$cpumem"｜tr -s " "| awk '{sum+=$9} END {print sum}'`
    memtotal=`echo -e "$cpumem"｜tr -s " "| awk '{sum+=$10} END {print sum}'`
    GPUMessage=`nvidia-smi | grep % | grep -v " 0%" | awk '{print $9,$10,$11,$12,$13}'`
    #将current转换为时间戳，精确到毫秒  
    #currentTimeStamp=$((timeStamp*1000+`date "+%N"`/1000000)) 
    echo "total %CPU "$cputotal"  total %MEM "$memtotal
    echo "GPU-Memmory-Usage  | GPU-Util"
    echo "$GPUMessage"
    current=`date "+%Y-%m-%d %H:%M:%S"`  
    timeStamp=`date -d "$current" +%s`   
    echo "timeStamp: "$timeStamp
    echo
    sleep 5
    cpumem=`top -n 1 -b | grep "testADSLab"`
done