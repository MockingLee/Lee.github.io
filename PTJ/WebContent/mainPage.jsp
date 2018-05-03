<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page language="java" import="com.Lee.Job"%>
  <%@ page language="java" import="com.Lee.Account"%>
  <%@ page language="java" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
<head>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/mainPage.js"></script>
    <script src="js/bootstrap.js"></script>
<style>
    .x1{
        margin-top: 100px;
    }

    </style>
    
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Account account = (Account)session.getAttribute("account");
%>



<div class="container" style="height: 51px">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="mainPage.jsp">PTJ</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                        <%if(account != null){ %>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="userBar"><%=account.getUsername()%><strong class="caret"></strong></a>
                        <%}else{ %>



                        <a href="login.jsp">请登录</a>




                        <%} %>
                        <ul class="dropdown-menu ">

                            <li>
                                <a href="userCenter.jsp">个人中心</a>
                            </li>
                            <li>
                                <a href="#">我的简历</a>
                            </li>
                            <li>
                                <a href="myapply">我的申请</a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="logout" id="logout_btn">退出</a>
                            </li>
                        </ul>
                    </li>
                    </ul>
                </div>

            </nav>
        </div>
    </div>
</div>



<jsp:useBean id="JobDAO" class="DAO.JobDao"></jsp:useBean>
<%ArrayList<Job> joblist = JobDAO.getJoblist(); 
Job job;
%>
<div class="container" >

        <div class="col-sm-3"></div>
        <div class="col-sm-6" style="background-color: #FFFFFF">
            <div class="page-header">
                <h1>
                    PTJ <small>Job List</small>
                </h1>
            </div>
            <ul id="list">
            <%  
            String paixu = request.getParameter("paixu");
            int num = joblist.size();
            Job[] joblist1 = new Job[num];

        
            if(paixu !=null){
            if(paixu.equals("xinshui")){
            	for(int i = num - 1; i > 0; --i)
            		for(int j = 0; j < i; ++j){
            			Job job1 = joblist.get(j);
            			Job job2 = joblist.get(j+1);
            			if(job1.getRemuneration()<job2.getRemuneration()){
            				Job t = joblist.get(j);
            		        joblist.set(j, joblist.get(j+1));
            		        joblist.set(j+1, t);
            			}
            		}
            }
            else if(paixu.equals("riqi")){
            	for(int i = num - 1; i > 0; --i)
            		for(int j = 0; j < i; ++j){
            			Job job1 = joblist.get(j);
            			Job job2 = joblist.get(j+1);
            			String[] sourceStrArray1 = job1.getDate().split("-");
            			String[] sourceStrArray2 = job2.getDate().split("-");
            			if(Integer.parseInt(sourceStrArray1[0])<Integer.parseInt(sourceStrArray2[0])){
            				Job t = joblist.get(j);
            		        joblist.set(j, joblist.get(j+1));
            		        joblist.set(j+1, t);
            			}
            			else if(Integer.parseInt(sourceStrArray1[0])==Integer.parseInt(sourceStrArray2[0])){
            				if(Integer.parseInt(sourceStrArray1[1])<Integer.parseInt(sourceStrArray2[1])){
            					Job t = joblist.get(j);
                		        joblist.set(j, joblist.get(j+1));
                		        joblist.set(j+1, t);
            				}
            				else if(Integer.parseInt(sourceStrArray1[1])==Integer.parseInt(sourceStrArray2[1])){
            					if(Integer.parseInt(sourceStrArray1[2])<=Integer.parseInt(sourceStrArray2[2])){
            						Job t = joblist.get(j);
                    		        joblist.set(j, joblist.get(j+1));
                    		        joblist.set(j+1, t);
            					}else{
            						
            					}
            				}
            				else{
            					
            				}
            			}
            			else{
            				
            			}
            			
            		}
            }
            else if(paixu.equals("no")){
            	if(paixu !=null){
            		int w =0;
            		String m=new String(request.getParameter("xinxi").getBytes("ISO-8859-1"),"UTF-8");

                	Job q =null;
                	for(Job p: joblist){

                		if(p.getTitle().equals(m)){
                			w = 1;
                			q = p;
              
                			
                		}
                	}
                	if(w ==0){%> 
                		<li>未查到相应信息</li>
                	<%}

                else{
                joblist.clear();
                joblist.add(q);
                }
                }

                }    else{
            	System.out.print("13");
            	}
            }

         %>  
            <%for(Job p: joblist){%>
                <li style="list-style-type:none;">
                
                
                
                    <div class="well well-lg">
                        <a href="JobDetails?info_id=<%=p.getId()%>"><%= p.getTitle() %></a>
                    </div>
                    <%} %>
                </li>

            </ul>



        </div>
        <div class="col-sm-3"></div>
   </div>

</div>
<div class="container">
        <div class="container">
            <div class="col-sm-3"></div>
            <div class="col-sm-6"  style="display: inline;position: absolute;top: 150px; left: 200px;height:300px; width: 200px;background-color: #EEEEEE">
                    <div style="margin-top: 20px">
                        <p style="font-size: 20px;">排序：</p>
                        <a href="mainPage.jsp?paixu=xinshui" style="font-size: 20px;" >按薪酬排序</a><br/>
                         <a href="mainPage.jsp?paixu=riqi" style="font-size: 20px;" >按发布日期排序</a>
                    </div>
						
						
						<div style="margin-top: 30px">
                        <p style="font-size: 20px;">查找：</p>
                        <input class="form-control" type="text" id="search">
                        <div class= "col-xm-offset-2" style="margin-left: 60px;margin-top:10px;">
                            <input type="button" class="btn-primary disabled" id="chaxun" value="查询">
                         </div>
                    </div>
						
						
             </div>
        </div>


    </div>

    



	

</body>
</html>