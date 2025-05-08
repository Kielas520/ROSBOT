# bobac3机器人模型

## 仿真

本包自带了一个现成的仿真地图reinovo_raicom.world，如果要使用该地图需要先下载地图的仿真模型：

```bash
$ cd ~/.gazebo

$ git clone https://gitee.com/reinovo/reinovo_robocom.git
```

下载完成后运行gazebo.launch即可

如不需要只用该地图只需注释gazebo.launch的第4行代码即可

```html
<!--arg name="world_name" value="$(arg world_name)" /-->
```

