# 环境配置
1. 解压元宝镜像
2. 新环境配置
    
    用户密码：**root**
    
    ```bash
    cd
    nano .bashrc
    ```
    
    ```
    # >>> reinovo initialize >>>
    export MAP_DIRECTORY=~/ros_workspace/maps
    source /opt/ros/noetic/setup.bash
    source ~/ros_workspace/devel/setup.bash
    # >>> reinovo initialize >>>
    export DISABLE_ROS1_EOL_WARNINGS=1
    
    # bashrc 添加到末尾
    alias eb='nano .bashrc'
    alias sb='source .bashrc'
    alias cb='rm -rf build devel && catkin_make'
    alias sd='source devel/setup.bash'
    alias sim='roslaunch bobac3_description gazebo.launch' # 开启仿真
    alias move='rosrun robot_control robot_control_node' # 代码控制机器人
    alias vcc='roslaunch bobac3_audio voice_collect.launch' # 语音采集
    alias vcd='roslaunch bobac3_audio voice_dictation.launch' # 语音听写
    alias vcs='roslaunch bobac3_audio voice_semanteme.launch' # 语义理解
    alias vct='roslaunch bobac3_audio voice_tts.launch' # 语音合成
    alias slam='roslaunch bobac3_slam bobac3_slam_sim.launch' # slam建图
    alias map='roslaunch bobac3_navigation demo_nav_2d.launch' # 2d巡航系统运行
    alias nav='rosrun nav_goal nav_multigoal_node' # 巡航功能启动
    alias tp='rosrun nav_goal nav_goal_node' # 直接传送到代码写好的坐标
    alias navvc='roslaunch bobac3_audio nav.launch' # 任务启动
    alias fsv='roslaunch face_rec face_rec_service.launch' # 单帧人脸识别（服务）
    alias ftp='roslaunch face_rec face_rec_topic.launch' # 持续识别（话题）
    alias save='rosrun map_server map_saver -f demo' # 保存 slam 扫描完的地图
    alias kb='rosrun teleop_twist_keyboard teleop_twist_keyboard.py' # 用键盘控制机器人
    alias pt='rosrun tf tf_echo /map base_footprint' # 查看当前坐标
    ```
    
    ```bash
    source .bashrc
    sb
    ```
    
    - 下载插件
        
        ```bash
        # download
        sudo apt-get install libasound2-dev
        sudo apt-get install sox
        sudo apt-get install libsox-fmt-mp3
        pip install dlib==19.19.0
        pip install face_recognition
        pip install opencv-python pyyaml onnxruntime
        ```
        
    
    ### **检查 Ubuntu 是否识别麦克风**
    
    ### arecord 检查录音设备
    
    1. 打开终端，安装 alsa-utils（如果未安装）：
        
        ```bash
        sudo apt update
        sudo apt install alsa-utils
        ```
        
    2. 列出可用的录音设备：
        
        ```bash
        arecord -l
        ```
        
    
    3.查看输出
    
    ```bash
    *** List of CAPTURE Hardware Devices ****
    card 0: Intel [HDA Intel], device 0: ALC269 Analog [ALC269 Analog] Subdevices: 1/1 Subdevice #0: subdevice #0
    ```
    
    - 有就对了，没有就是没传入，自己去看看VM的SoundCard设置
    记得在ubuntu设置把麦克风打开
    
    测试录音：
    
    ```bash
    arecord -d 5 -f cd test.wav
    aplay test.wav
    ```
# 部署
- 将本人工程放入镜像中
```
# 第一次配置
git config --global user.name "Kielas"
git config --global user.email "c1470759@outlook.com"

# 设置代理
git config --global http.proxy http://127.0.0.1:7897
git config --global https.proxy https://127.0.0.1:7897
```
```
cd
git clone https://github.com/Kielas520/ROSBOT.git ros_workspace
```
- 这里要感谢 [机器人工匠阿杰](https://space.bilibili.com/411541289) 提供的 激光雷达滤波算法
- 将源码克隆至src目录下
```
cd ~/ros_workspace/src
git clone https://github.com/6-robot/jie_ware.git
```
- 删除他的git仓库
- 最后 进行编译
```
cd ~/ros_workspace
cb
```  
- 比赛用到的镜像已经配好环境的工作空间，功能包都在 bobac3_ws 文件夹内，只需要将里面的功能包拖动到自己的工程目录（ros_workspace）即可，并且把 navigation 的 map 拖到工程根目录下的 maps 就可以使用。




