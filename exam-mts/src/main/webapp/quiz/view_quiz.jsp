<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/Pager.tld" prefix="page" %>
<%@ page import="com.zhjedu.util.DateTimeUtil"%>
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
-->
</style>
<link href="<%=request.getContextPath()%>/css/ksmain.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
function secBoard(quiz,status){
    	flag = status;
       if(status!=null)
       {
       
       window.location.href="Quiz.do?method=getStudentQuizList&status="+status+"&quiz="+quiz+"&quizType=1";
       }
    }
</script>
<table border="0" width="100%" id="table4">
  
  <tr>
    <td><div align="left">
      <table border="0" width="100%" id="table4">
        <tr bgcolor="#7FBEE6">
          <td width="96%" height="30" colspan="4"><p align="center"> <span class="style1">考试信息 </span>　</p></td>
        </tr>
        <tr bgcolor="#EEF7FF">
          <td width="96%" height="28"><span class="style1"> 考试名称：</span></td>
          <td width="96%" height="28" align="left"><html:text property="name" name="quiz" size="29" /></td>
        </tr>
        <tr bgcolor="#F7FBFF">
          <td width="96%" height="24" align="center"><p align="left" class="style1"> 考试方式：</p></td>
          <td height="24" align="left"><html:select property="examType" name="quiz" size="1">
           
            <html:option value="1">固定</html:option>
			<html:option value="2">手工</html:option>
			<html:option value="0">随机</html:option>
          </html:select>
          </td>
        </tr>
        <tr bgcolor="#EEF7FF">
          <td width="96%" align="center"><p align="left" class="style1">计分方式</p></td>
          <td width="96%" align="left"><html:select property="grademethod" size="1" name="quiz">
            <html:option value="0">最后成绩</html:option>
            <html:option value="1">平均成绩</html:option>
            <html:option value="2">最高成绩</html:option>
            
          </html:select>
         </td>
        </tr>
        
        <bean:define id="tmp1" name="quiz" property="timeopen"/>
        <bean:define id="tmp2" name="quiz" property="timeclose"/>                  
        
        <tr bgcolor="#F7FBFF">
          <td width="96%"><span class="style1"> 有 效 期：</span></td>
          <td width="96%"><input type="text" name="T7" size="29" value="<%=DateTimeUtil.getTime((Long)tmp1,2) %>--<%=DateTimeUtil.getTime((Long)tmp2,2) %>" /></td>
          
        </tr>
        <tr bgcolor="#EEF7FF">
          <td width="96%"><span class="style1"> 应参加人数：</span></td>
          <td width="96%"><input type=text name="oughtnumber" value=<%=(String)request.getAttribute("oughtnumber") %> size="29" /></td>
          
        </tr>
        <tr bgcolor="#F7FBFF">
          <td width="96%"><span class="style1"> 实际参加人数：</span></td>
          <td width="96%"><input type=text name="factnumber" value=<%=(String)request.getAttribute("factnumber") %> size="29" /></td>
        </tr>
        <tr bgcolor="#EEF7FF">
          <td width="96%" height="28"><span class="style1"> 监考密码：</span></td>
          <td width="96%" height="28" align="left"><html:text property="password" name="quiz" size="29" /></td>
        </tr>
        <tr bgcolor="#F7FBFF">
          <td width="96%" height="28"><span class="style1"> 发布范围：</span></td>
          <td width="96%" height="28" align="left">
          <select name="" size="6">
          <logic:iterate indexId="ind" id="element" name="examCourseList">
          	<option><bean:write name="element" property="ecName"/></option>
          </logic:iterate>
          </select>          
          </td>
        </tr>
        <tr bgcolor="#EEF7FF">
          <td width="96%" height="53"><span class="style1"> 备&nbsp;&nbsp;&nbsp; 注：</span></td>
          <td height="53" colspan="3"><html:textarea property="description" name="quiz" rows="3" cols="67"/>
          </td>
        </tr>
        
        <tr>
          <td align="center" colspan="4">&nbsp;
                <input type="button" class="btn_cm_big" onclick="secBoard('<bean:write property="id" name="quiz"/>','3')" value="已完成考试" name="B9" />
            &nbsp;&nbsp;&nbsp;
            <input name="B7" class="btn_cm_small" type="button" onclick="javascript:history.go(-1)" value="返回" />
            &nbsp; </td>
        </tr>
      </table>
      <p>　</p>
    </div></td>
  </tr>
</table>

