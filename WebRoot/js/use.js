Vue
		.component(
				'my-min-sidebar-switch',
				{
					props : [ 'my-href' ],
					template : '<li class="have-img"><A class="wrap-img"'
							+ +'href="{{ my-href }}"><img alt="300" src="img/index/1480410-dc9d2be35d880969.png"></A>'
							+ '<div><P class="list-top"><A class="author-name blue-link" href="http://www.jianshu.com/users/db6171d91553"'
							+ 'target="_blank">丧心病狂的小坚果儿</A> <EM>·</EM> <span class="time" data-shared-at="2016-07-10T14:43:28+08:00"></span></P>'
							+ '<H4 class="title"><A href="{{ my-href }}" target="_blank">这些含金量十足的英语证书你一定要考！吐血整理（附真题、答案及听力音频下载）</A></H4>'
							+ '<div class="list-footer"><A href="{{ my-href }}" target="_blank">阅读 4249 </A> '
							+ '<A href="http://www.jianshu.com/p/cb254b7647d7#comments" target="_blank"> · 评论 65 </A> '
							+ '<span> · 喜欢 495</span> <span>· 打赏 2</span></div></div></li>'
				})