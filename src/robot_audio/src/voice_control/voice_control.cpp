#include "voice_control.h"
#include <iostream>
Control::Control(){
  control_server = nh.advertiseService("voice_control", &Control::control_cb, this);
  move_client = nh.serviceClient<bobac3_msgs::SetRelativeMove>("relative_move");
  tts_client = nh.serviceClient<robot_audio::robot_tts>("voice_tts");
}
 
Control::~Control(){
}

bool Control::control_cb(robot_audio::Control::Request &req, robot_audio::Control::Response &res){
	float num=req.value;
	if(req.controlInfo[0]=="前进"){
		move_srv.request.mode = 0;
		move_srv.request.relative_move = req.value;
	}
	else if(req.controlInfo[0]=="后退"){
		move_srv.request.mode = 0;
		move_srv.request.relative_move = -req.value;
	}
	else if(req.controlInfo[0]=="左移"){
		move_srv.request.mode = 1;
		move_srv.request.relative_move = req.value;
	}
	else if(req.controlInfo[0]=="右移"){
		move_srv.request.mode = 1;
		move_srv.request.relative_move = -req.value;
	}
	else if(req.controlInfo[0]=="左转"){
		move_srv.request.mode = 2;
		move_srv.request.relative_move = req.value;
	}
	else if(req.controlInfo[0]=="右转"){
		move_srv.request.mode = 2;
		move_srv.request.relative_move = -req.value;
	}
	tts_srv.request.text = req.controlInfo[1];
	tts_srv.request.play = true;
	tts_client.call(tts_srv);
	res.result= true;
	if(!move_client.call(move_srv)){
		res.result= false;
	}
	return true;
}

int main(int argc, char* argv[])
{
  /*初始化ros节点*/
  ros::init(argc, argv, "voice_control");
  /*定义节点句柄*/
  Control control;
  ros::spin();
  return 0;
}
