/**
 * 最简单的基于ActionScript的RTMP播放器
 * Simplest AS3 RTMP Player
 *
 * 雷霄骅 Lei Xiaohua
 * leixiaohua1020@126.com
 * 中国传媒大学/数字电视技术
 * Communication University of China / Digital TV Technology
 * http://blog.csdn.net/leixiaohua1020
 * 
 * 本程序使用ActionScript3语言完成，播放RTMP服务器上的流媒体
 * 是最简单的基于ActionScript3的播放器。
 *
 * This software is written in Actionscript3, it plays stream
 * on RTMP server
 * It's the simplest RTMP player based on ActionScript3.
 * 
 */
package {
    import flash.display.Sprite;
    import flash.net.NetConnection;
    import flash.events.NetStatusEvent;
    import flash.events.AsyncErrorEvent;
    import flash.net.NetStream;
    import flash.media.Video;

    public class simplest_as3_rtmp_player extends Sprite
    {
        var nc:NetConnection;
        var ns:NetStream;
		var video:Video;
		var room:String="";

        public function simplest_as3_rtmp_player()
        {
			loadVarsDemo();
            nc = new NetConnection();
			nc.client = this;
            nc.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			nc.connect("rtmp://s2.weiqu168.com/live");
        }

		private function loadVarsDemo():void
        {
          	room += stage.loaderInfo.parameters["channel"];
			room+="/";
            room += stage.loaderInfo.parameters["room"];
            //lblVars.text = room;
        }

        private function netStatusHandler(event:NetStatusEvent):void
        {
			trace("event.info.level: " + event.info.level + "\n", "event.info.code: " + event.info.code);
            switch (event.info.code)
            {
                case "NetConnection.Connect.Success":
	                doVideo(nc);
	                break;
				case "NetConnection.Connect.Failed":
					break;
                case "NetConnection.Connect.Rejected":
					break;
	            case "NetStream.Play.Stop":
					break;
	            case "NetStream.Play.StreamNotFound":
					break;
	        }
        }

		public function onBWDone():void{}
        // play a recorded stream on the server
        private function doVideo(nc:NetConnection):void {
            ns = new NetStream(nc);
			 var clientobj=new Object(); clientobj.onMetaData=function(){}; 
			 ns.client=clientobj; 
            ns.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);

            video = new Video();
            video.attachNetStream(ns);

            ns.play(room);
            addChild(video);
        }

        // create a playlist on the server
		/*
        private function doPlaylist(nc:NetConnection):void {
            ns = new NetStream(nc);
            ns.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);

            video = new Video();
            video.attachNetStream(ns);

            // Play the first 3 seconds of the video
            ns.play( "bikes", 0, 3, true );
			// Play from 20 seconds on
            ns.play( "bikes", 20, -1, false);
			// End on frame 5
			ns.play( "bikes", 5, 0, false );
            addChild(video);
        }
		*/
    }
}
