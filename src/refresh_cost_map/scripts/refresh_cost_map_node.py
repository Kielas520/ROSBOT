import rospy
from dynamic_reconfigure.client import Client

def main():
    # 初始化ROS节点，名称为refresh_cost_map_node
    rospy.init_node('refresh_cost_map_node', anonymous=True)
    
    # 连接到local_costmap的dynamic_reconfigure客户端
    costmap_client = None
    try:
        costmap_client = Client('/move_base_node/local_costmap', timeout=10)
        rospy.loginfo("成功连接到 local_costmap dynamic_reconfigure 客户端")
    except Exception as e:
        rospy.logerr("连接 local_costmap dynamic_reconfigure 失败: %s", str(e))
        return

    # 初始状态：从2.0开始
    current_width = 2.0
    rate = rospy.Rate(30)  # 每秒调整一次（1 Hz）

    while not rospy.is_shutdown():
        try:
            # 更新参数
            params = {'width': current_width}
            costmap_client.update_configuration(params)
            rospy.loginfo("已将 local_costmap width 设置为: %.1f", current_width)
            
            # 切换到下一个值
            if current_width == 2.0:
                current_width = 2.1
            else:
                current_width = 2.0
            
            rate.sleep()  # 等待1秒
        except Exception as e:
            rospy.logerr("更新参数失败: %s", str(e))
            rate.sleep()  # 即使失败也继续循环

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
