<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.dfcw.zjproject.zj.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="<%=request.getContextPath()%>/css/ksmain.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.sec1 {cursor: hand;
font-size:12px;
color: #000000;
width:107;
height:25;
background-image=url(image/x-00100.gif);
}
.style1 {font-size: 12px}
.style11 {color: #164f8e;
	font-weight: bold;
}
.style11 {color: #164f8e; font-weight: bold; font-size: 14px; }
.style12 {color: #0000FF}
.style13 {color: #3b6ba0}
.style14 {	font-size: 36px;
	color: #3B6BA0;
}
.style8 {color: #0000FF; font-size: 12px; }
.style9 {font-size: 14px}
-->
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>无标题文档</title>
		<script src="<%=request.getContextPath() %>/js/dtree.js"></script>
	</head>
	<script language="javascript">
		function gv_showWait(div,flag) {
			var DHTML = (document.getElementById || document.all || document.layers);  
			if (!DHTML) return;
				var x = gv_getObj(div);  
				x.visibility = (flag) ? 'visible':'hidden'    
				if(! document.getElementById) {  
					if(document.layers) {  
						x.left=280/2;  
					}  
				}  
			//loadImages();  
			return true;    
		}
		function gv_getObj(name) {    
			if (document.getElementById) {    
				return document.getElementById(name).style;    
			} else if (document.all) {   
				return document.all[name].style;    
			} else if (document.layers) {    
				return document.layers[name];    
			}    
		}
		function search(){
			if(document.QuizForm.institution.value == "0"){
				alert("请选择网院！");
				document.QuizForm.institution.focus();
				return;
			}
			if(document.QuizForm.recruitbatch.value == "0"){
				alert("请选择入学批次！");
				document.QuizForm.recruitbatch.focus();
				return;
			}
			if(document.QuizForm.studykind.value == "0"){
				alert("请选择培养层次！");
				document.QuizForm.studykind.focus();
				return;
			}
			if(document.QuizForm.subject.value == "0"){
				alert("请选择专业！");
				document.QuizForm.subject.focus();
				return;
			}
			document.QuizForm.target="rightFrame";
			document.QuizForm.submit();
		}
		function sbt(){
			gv_showWait('waitDiv', 1);
			window.location.href="<%=request.getContextPath()%>/Quiz.do?method=leftForQuiz&institution=" + QuizForm.institution.value + "&recruitbatch=" + QuizForm.recruitbatch.value + "&studykind=" + QuizForm.studykind.value;
		}
	</script>
    <%
    String institution = request.getParameter("institution");
    String recruitbatch = request.getParameter("recruitbatch");
    String studykind = request.getParameter("studykind");
    List studykindList = (List)request.getAttribute("studykinds");
    List subjectList = (List)request.getAttribute("subjects");
    List institutionList = (List)request.getAttribute("institutions");
    List learncenterList = (List)request.getAttribute("learncenters");
    List recruitbatchList = (List)request.getAttribute("recruitbatchs");
     %>
	<body topmargin="0" leftmargin="0">
<DIV id="waitDiv" style="LEFT: 20%; VISIBILITY: hidden; POSITION: absolute; TOP: 50%; TEXT-ALIGN: center">
<TABLE cellPadding=6 border=0>
<TBODY><TR><TD align=middle>
<IMG  src="<%=request.getContextPath()%>/image/loading.gif" alt="请稍候..." width="191" height="8"/>
<BR/>
<FONT color="red">数据载入中，请稍候...</FONT></TD></TR></TBODY></TABLE></DIV>
		<table width="100%" height="540" border="0" cellpadding="0"
			cellspacing="0" bgcolor="#CAE4FF" id="table2">
			<tr>
				<td width="5%" bgcolor="#7FBEE6">&nbsp;</td>
				<td valign="top" bgcolor="#7FBEE6">
					<div align="left">
						<html:form action="Quiz.do" target="rightFrame">
						<html:hidden property="method" value="selectUserScopeForQuiz" />
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
									<div align="left">
										<p class="style1">
											网院：<br><select size="1" name="institution" onchange="sbt()">
											<option value="0">请选择..</option>
											<%
											for(int i=0;i<institutionList.size();i++){
												InstitutionModel im = (InstitutionModel)institutionList.get(i);
											 %>
											<option value="<%=im.getId()%>" <%if((im.getId() + "").equals(institution)){out.print("selected");}%>><%=im.getName()%></option>
											<%} %>
											</select>
										</p>
									</div>
								</td>
							</tr>
							<tr>
								<td valign="top">
									<div align="left">
										
										<p class="style1">
											入学批次：<br><select size="1" name="recruitbatch">
											<option value="0">请选择..</option>
											<%
											for(int i=0;i<recruitbatchList.size();i++){
												RecruitbatcModel rm = (RecruitbatcModel)recruitbatchList.get(i);
											 %>
											<option value="<%=rm.getId()%>" <%if((rm.getId() + "").equals(recruitbatch)){out.print("selected");}%>><%=rm.getName()%></option>
											<%} %>
											</select>
										</p>
									</div>
								</td>
							</tr>
							<tr>
								<td valign="top">
									<div align="left">
										
										<p class="style1"> 
											培养层次：<br><select size="1" name="studykind">
											<option value="0">请选择..</option>
											<%
											for(int i=0;i<studykindList.size();i++){
												StudyKindModel skm = (StudyKindModel)studykindList.get(i);
											 %>
											<option value="<%=skm.getId()%>" <%if((skm.getId() + "").equals(studykind)){out.print("selected");}%>><%=skm.getName()%></option>
											<%} %>
											</select>
										</p>
									</div>
								</td>
							</tr>
							<tr>
								<td valign="top">
									<div align="left">
										<p class="style1">
											专业：<br><select size="1" name="subject">
											<option value="0">请选择..</option>
											<%
											for(int i=0;i<subjectList.size();i++){
												SubJectModel sjm = (SubJectModel)subjectList.get(i);
											 %>
											<option value="<%=sjm.getId()%>"><%=sjm.getName()%></option>
											<%} %>
											</select>
										</p>
									</div>
								</td>
							</tr>
						</table>
						<br />
						<p align="center"><input name="Submit"  class="btn_cm_small" type="button" onClick="search();"  value="查询"/></p>
						</html:form>
					</div>
					<p class="style1">
					<font color="#FF0000">请从右侧查询出来的科目列表中选择要发布的科目，点击选择按钮。请注意：同一培训机构、学习批次、学习层次、专业方向下只允许选择一个科目。</font>
					</p>
				</td>
			</tr>
		</table>
	</body>
</html>
