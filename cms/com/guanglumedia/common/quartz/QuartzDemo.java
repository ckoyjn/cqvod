package com.guanglumedia.common.quartz;
import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;

	public class QuartzDemo {
		private static final Logger logger = Logger.getLogger(QuartzDemo.class);
		public static void execute(JobExecutionContext context){
			logger.info("测试  Quartz 集群模式...");
		}
	
	}