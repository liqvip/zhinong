package cn.blogss.common.util;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/*
 * Author:LiQiang
 * Time:2018/7/12
 * Description: 分页标签
*/
public class Pager extends TagSupport{

	/**
	 * pageIndex,当前第几页
	 * pageSize,每页显示的记录数
	 * totalNum,总记录数
	 * submitUrl,提交地址
	 */
	private static final long serialVersionUID = 1L;
	
	private int pageIndex;
	private int pageSize;
	private int totalNum;
	private String submitUrl;
	
	

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public String getSubmitUrl() {
		return submitUrl;
	}

	public void setSubmitUrl(String submitUrl) {
		this.submitUrl = submitUrl;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		JspWriter out = this.pageContext.getOut();
		StringBuffer sb = new StringBuffer();
		String jumpUrl = "";
		//计算总页数
		int totalPageNum = this.totalNum%this.pageSize==0?this.totalNum/this.pageSize:this.totalNum/this.pageSize+1;

		if(this.totalNum>0) {
			StringBuffer pager = new StringBuffer();
				//如果当前为第一页
				if(this.pageIndex==1) {
					//上一页不能点击
					pager.append("");
					
					//计算中间页码
					calcMiddle(pager,totalPageNum);
					
					//如果总共就一页，那么下一页也不能点击
					if(totalPageNum==1) {
						pager.append("");
					}else {
						//可以点击下一页
						jumpUrl = this.submitUrl.replace("{0}", String.valueOf(this.pageIndex+1));
						pager.append("<a href='"+jumpUrl+"' class='np'>下一页</a>");
					}
				}else if(this.pageIndex==totalPageNum) {//当前页面是尾页
					//可以点击上一页
						jumpUrl = this.submitUrl.replace("{0}", String.valueOf(this.pageIndex-1));
						pager.append("<a href='"+jumpUrl+"' class='np'>上一页</a>");

					//计算中间页码
					calcMiddle(pager,totalPageNum);

					//下一页不能点击
					pager.append("");
					
				}else {//当前页码既不是第一页也不是尾页
					//可以点击上一页
					jumpUrl = this.submitUrl.replace("{0}", String.valueOf(this.pageIndex-1));
					pager.append("<a href='"+jumpUrl+"' class='np'>上一页</a>");
					
					//计算中间页码
					calcMiddle(pager,totalPageNum);

					//可以点击下一页
					jumpUrl = this.submitUrl.replace("{0}", String.valueOf(this.pageIndex+1));
					pager.append("<a href='"+jumpUrl+"' class='np'>下一页</a>");
				}
				//开始行
				int startSize = (this.pageIndex-1)*this.pageSize+1;//1,1|2,11
				//结束行
				int endSize = this.pageIndex==totalPageNum?this.totalNum:this.pageIndex*this.pageSize;
				sb.append("<table align='center' class='baidu'>");
				sb.append("<tr><td>"+pager.toString()+"</td></tr>");
				sb.append("<tr><td>总共<font color='red'>"+totalNum+"</font>条记录,当前显示<font color='red'></font>"+startSize+"-"+endSize+"条记录</td></tr>");
				sb.append("</table>");
				
		}else {
			sb.append("<table align='center'><tr><td>总共<font color='red'>0</font>条记录,当前显示<font color='red'>0-0条记录</font></td></tr></table>");
		}

		try {
			out.print(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	/*
	 * @param,pager
	 * @param,totalPageNum
	 *计算中间页码
	 */
	private void calcMiddle(StringBuffer pager, int totalPageNum) {
		// TODO Auto-generated method stub
		//如果总页码数小于等于5,则中间页码全部显示
		String jumpUrl = "";

		if(totalPageNum<=5) {
			for(int i=1;i<=totalPageNum;i++) {
				//如果是当前页码则不能点击
				if(i==this.pageIndex) {
					pager.append("<span class='disabled'>"+i+"</span>");
				}else {//否则可以点击
					jumpUrl = this.submitUrl.replace("{0}", String.valueOf(i));
					pager.append("<a href='"+jumpUrl+"'>"+i+"</a>");
				}
			}
		}else {//总页数超过5
			//如果当前页码靠近首页 1 2 3 ...100
			if(this.pageIndex<=3) {
				for(int i=1;i<=4;i++) {
					//如果是当前页码则不能点击
					if(i==this.pageIndex) {
						pager.append("<span class='disabled'>"+i+"</span>");
					}else {//否则可以点击
						jumpUrl = this.submitUrl.replace("{0}", String.valueOf(i));
						pager.append("<a href='"+jumpUrl+"'>"+i+"</a>");
					}
				}
				//拼装...
				pager.append("...");
				//拼装尾页
				jumpUrl = this.submitUrl.replace("{0}", String.valueOf(totalPageNum));
				pager.append("<a href='"+jumpUrl+"'>"+totalPageNum+"</a>");
			}else if((this.pageIndex+3)>=totalPageNum) {
				//当前页码靠近尾页 	1...91 92 93 94 95 96 97 98 99 100
				//拼装首页
				jumpUrl = this.submitUrl.replace("{0}", String.valueOf(1));
				pager.append("<a href='"+jumpUrl+"'>"+1+"</a>");
				//拼装...
				pager.append("...");
				for(int i=totalPageNum-4;i<=totalPageNum;i++) {
					//如果是当前页码则不能点击
					if(i==this.pageIndex) {
						pager.append("<span class='disabled'>"+i+"</span>");
					}else {//否则可以点击
						jumpUrl = this.submitUrl.replace("{0}", String.valueOf(i));
						pager.append("<a href='"+jumpUrl+"'>"+i+"</a>");
					}
				}
			}else {
				//当前页码靠近中间 1..87 88 80 90 91 92 93 94 95 ...100
				//拼装首页
				jumpUrl = this.submitUrl.replace("{0}", String.valueOf(1));
				pager.append("<a href='"+jumpUrl+"'>"+1+"</a>");
				//拼装...
				pager.append("...");

				for(int i=pageIndex-2;i<=pageIndex+2;i++) {
					//如果是当前页码则不能点击
					if(i==this.pageIndex) {
						pager.append("<span class='disabled'>"+i+"</span>");
					}else {//否则可以点击
						jumpUrl = this.submitUrl.replace("{0}", String.valueOf(i));
						pager.append("<a href='"+jumpUrl+"'>"+i+"</a>");
					}
				}
				
				//拼装...
				pager.append("...");
				//拼装尾页
				jumpUrl = this.submitUrl.replace("{0}", String.valueOf(totalPageNum));
				pager.append("<a href='"+jumpUrl+"'>"+totalPageNum+"</a>");
				
			}
		}
		
	}

	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		System.out.println("-----end------");
		return super.doEndTag();
	}
}
