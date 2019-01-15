package cn.blogss.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import static java.lang.annotation.ElementType.METHOD; 
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Retention(RUNTIME) 
@Target(METHOD)
/*
*   spring mvc 自定义注解拦截恶意请求
*/
public @interface AccessLimit {
	
	int seconds() default 3;
	int maxCount() default 5;
}
