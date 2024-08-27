<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
	<title>Farmstory</title>
	<style>
		main {
			height: 600px;
			width: auto;
			
			background-color: #EEEE;
			position: relative;
		}
		
		main>p {
			position: absolute;
			float: left;
			left: 50%;
			margin-left: -69px;
			top: 50%;
		}
	.terms {
      width: 600px;
      height: auto;
      margin: 0 auto;
      box-sizing: border-box;
    }
    .terms>table {
      width: 100%;
      height: auto;
      border-collapse: collapse;
      border-spacing: 0;
      border-top: 2px solid #111;
    }
    .terms>table>caption {
      text-align: left;
      font-weight: bold;
      padding: 10px 0;
      box-sizing: border-box;
    }
    .terms>table tr {}
    .terms>table td {
      padding: 6px;
      border: 1px solid #E9E9E9;
      box-sizing: border-box;
    }
    .terms>table td>textarea {
      width: 100%;
      height: 200px;
      resize: none;
      background: #EFEFEF;
      border: 1px solid #E4EAEC;
      padding: 2px;
      box-sizing: border-box;
      overflow-y:auto;
      
    }
    .terms>table td>label {
      float: right;
    }
    .terms>table td>label>input[type=checkbox] {}
    .terms>table p {
      float: right;
    }
    .terms>div {
      float: right;
      margin-top: 10px;
    }
    .btnCancel {
      margin-right : 10px;
      }
		
	</style>
</head>
<body>
	<%@ include file="/css/_header.jsp"%>



  <main>
    <section class="terms">
      <table>
        <caption>사이트 이용약관</caption>
        <tr>
          <td>
            <textarea readonly></textarea>
            <p>
              <label><input type="checkbox" name="chk1" />동의합니다.</label>
            </p>
          </td>
        </tr>
      </table>
      <table>
        <caption>개인정보 취급방침</caption>
        <tr>
          <td>
            <textarea readonly></textarea>
            <p>
              <label><input type="checkbox" name="chk2" />동의합니다.</label>
            </p>
          </td>
        </tr>
      </table>
      <div>
        <a href="/FarmStoryJSP/user/login.do" class="btnCancel">취소</a>
        <a href="/FarmStoryJSP/user/register.do" class="btnNext">다음</a>
      </div>
    </section>
  </main>



	<%@ include file="/css/_footer.jsp"%>
</body>
</html>