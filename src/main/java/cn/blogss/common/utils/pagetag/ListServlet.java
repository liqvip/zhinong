package cn.blogss.common.utils.pagetag;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageIndex = request.getParameter("pageIndex");
		
		if(pageIndex == null || pageIndex.equals("")) {
			pageIndex = "1";
		}

		request.setAttribute("pageIndex", pageIndex);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
