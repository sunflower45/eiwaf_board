<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/main-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">관리자시스템</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">
<script type="text/javascript">
//<![CDATA[
    var fvIsTopFrame = true;

	if (window.top != this) {
		eiwaf_IntroPag();
		fvIsTopFrame = false;
	}

	function eiwaf_DocumentReady(status) {
		if (!fvIsTopFrame) {
			return;
		}
		var f = document.form1;
		f.user_id.focus();
		$("body").attr("background", "/images/login_bg.gif");
	}

	function DoLogin() {
		var f = document.form1;
		if (uif_CheckNullOrEmpty(f.user_id)
			|| uif_CheckNullOrEmpty(f.login_passwd)
			) {
			return;
		}
		svcf_Ajax("/main/login.do", f, {
			callbackFn: function(status, data) {
				if (status.code == 0) {
					svcf_Link("/main/main.do");
					return;
				}
				alert(status.message.br2nl());
			}
		});
		f.login_passwd.value = "";
	}
//]]>
</script>
<form name="form1" FormEvent="true" EnterAction="DoLogin();">
<div id="divCenter">
	<div class="introBox">
		<div class="flashArea">
			<img src="/images/intro.png" width="722" height="440" />
		</div>
		<div class="guideArea">
			<div class="login">
				<span class="login-input">
					<label><img src="/images/id.png" /></label>
					<input type="text" name="user_id" title="아이디" InputType="true" EnterTab="true" ImeMode="inactive"/><br/>

					<label><img src="/images/pw.png" /></label>
					<input type="password" name="login_passwd" title="패스워드" InputType="true" EnterAction="true"/>
				</span>

				<span class="login-btn"><a href="#" onclick="DoLogin();"><img src="/images/login_out.png" class="png24" /></a></span>
			</div>
		</div>
	</div>
</div>
</form>

</ei:layoutComponent>
</ei:layoutRender>