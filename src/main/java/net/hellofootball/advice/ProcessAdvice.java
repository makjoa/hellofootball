package net.hellofootball.advice;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Repository;
import org.springframework.util.StopWatch;


@Aspect
@Repository("processAdvice")
public class ProcessAdvice {
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Around(value="execution(* net.hellofootball..*.*(..))")
	public Object aroundMethod(ProceedingJoinPoint joinPoint) throws Throwable {
		String methodName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getName();
		logger.debug(className+"."+methodName+" Start!!");
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object retVal = joinPoint.proceed();
		
		stopWatch.stop();
		
		logger.debug(className+"."+methodName
				+" End !!, lead time = " + stopWatch.getTotalTimeMillis() + "ms!!  "
				+ stopWatch.getTotalTimeSeconds() + "s");
		return retVal;
	}

	
}
