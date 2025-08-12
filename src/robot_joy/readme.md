# robot_joy功能包使用说明

### 适用系统（ubuntu）——ros kinetic、ros melodic、ros noetic

### 编译安装

#### 依赖安装（除ros官方常用的功能包外）

```shell
$ sudo apt install ros-${ROS_DISTRO}-joy
```

#### 下载

使用git clone将该功能包下载到工作空间中

#### 编译

```shell
$ catkin_make
```

### 运行

根据需要连接的设备修改launch目录下ptz.launch的参数，输入以下指令运行：

```shell
$ roslaunch robot_joy robot_joy.launch
```

### 手柄控制（X360布局）
 
<u>**由于一些手柄键位不同，所以直接给出/joy中对应的原始数据位，括号中为我使用的手柄键位作为参考**</u>

前进：axes[1] = 1（LS摇杆上推）

后退：axes[1] = -1（LS摇杆下推）

左移：axes[4] = 1（LS摇杆左推）

右移：axes[4] = -1（LS摇杆右推）

左转：axes[0] = 1（RS摇杆左推）

右转：axes[0] = -1（RS摇杆右推）

加速：axes[5] = -1（RT键按下）

减速：axes[2] = -1（LT键按下）

增加最大线速度：buttons[0] （A键按下）

减小最大线速度：buttons[1] （B键按下）

增加最大角速度：buttons[2] （X键按下）

减小最大角速度：buttons[3] （Y键按下）

### 话题（topic）

#### 订阅

/joy（sensor_msgs/Joy）: 手柄控制话题

#### 发布

～/cmd_vel（geometry_msgs/Twist）：速度数据



