<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="write">
                <h3>글쓰기</h3>
                <article>
                	<!-- 
                		multipart/form-data로 데이터 및 파일 전송을 위해 톰캣 설정해야됨 안하면 getParameter 수신 안됨
                		 - 톰캣 context.xml > Context 태그에 allowCasualMultipartParsing="true" 설정
						 - 톰캣 server.xml > Connector 태그에 maxPostSize="10485760" (1024 x 1024 x 10 = 10MB) 설정                		
                	-->
                    <form action="/FarmStoryJSP/article/write.do?group=${group}&cate=${cate}" method="post"><!--  enctype="multipart/form-data" -->
                    	<input type="hidden" name="writer" value="${sessUser.uid}">
                    	<input type="hidden" name="artGroup" value="${group}">
                    	<input type="hidden" name="artCate" value="${cate}">
                        <table>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="artTitle" placeholder="제목을 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="artContent"></textarea>                                
                                </td>
                            </tr>
                            <tr>
                                <td>첨부</td>
                                <td>
                                	<p style="margin-bottom: 6px;">
                                		최대 2개 파일 첨부 가능, 각 파일당 최대 10MB까지 가능
                                	</p>
                                	<input type="file" name="file1"/>
                                	<input type="file" name="file2"/>                                	
                                </td>
                            </tr>
                        </table>
                        <div>
                            <a href="/FarmStoryJSP/article/list.do?group=${group}&cate=${cate}" class="btnCancel">취소</a>
                            <input type="submit"  class="btnWrite" value="작성완료">
                        </div>
                    </form>
                </article>
            </section>