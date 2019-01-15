package cn.blogss.listener;

import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.blogss.common.util.AddressUtil;
import cn.blogss.common.util.UserAgentUtil;
import cn.blogss.common.util.UserIpUtil;
import cn.blogss.pojo.Visit;
import cn.blogss.service.VisitService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class VisitTimesListener implements ServletRequestListener {
	private Log log = LogFactory.getLog(getClass());
	private ApplicationContext applicationContext = null;

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {

	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		HttpServletRequest request = (HttpServletRequest) arg0
				.getServletRequest();
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();
		Visit visit = null;
		VisitService visitServiceImpl = null;
		applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);
		try {
			visitServiceImpl = (VisitService) applicationContext
					.getBean("visitServiceImpl");
			if (session.isNew()) {
				/*log.debug("-------applicationContext--------");
				log.debug("begin- " + applicationContext + " -end");
				log.debug("-----begin-----");
				log.debug(applicationContext.getBean("visitServiceImpl"));*/
				// 先判断当前ip当天是否已经访问过,如果没有则保存当前访问记录
				visit = new Visit();
				visit.setIp(UserIpUtil.getIp(request));
				visit.setTime(new Date());
				String userAgent = request.getHeader("user-agent");
				visit.setUseragent(userAgent);
				synchronized (this) {
					if (visitServiceImpl.findVisitTimes(visit) == 0) {
						visit.setPlatformtype(UserAgentUtil.getUserAgent(
								userAgent).getPlatformtype());
						visit.setBrowsertype(UserAgentUtil.getUserAgent(
								userAgent).getBrowsertype());
						visit.setUrl(request.getRequestURL().toString());
						visit.setCity(new AddressUtil().getAddresses("ip="+visit.getIp(), "utf-8"));
						visitServiceImpl.add(visit);
					}
				  }
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}