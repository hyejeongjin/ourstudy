<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>글수정</h2>
	<form:form action="update.do" id="update_form" modelAttribute="reviewVO" enctype="multipart/form-data">
	    <form:hidden path="r_num"/>               
		<ul>
			<li>
				<label for="title">제목</label>
				<form:input path="r_title"/>
				<form:errors path="r_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="rate">별점</label>
				<form:radiobutton path="r_rate" value="5" id="status5"/>★★★★★
				<form:radiobutton path="r_rate" value="4" id="status4"/>★★★★
				<form:radiobutton path="r_rate" value="3" id="status3"/>★★★
				<form:radiobutton path="r_rate" value="2" id="status2"/>★★
				<form:radiobutton path="r_rate" value="1" id="status1"/>★
			</li>
			<li>
				<label for="content">내용</label>
				<form:textarea path="r_content"/>
				<form:errors path="r_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#r_content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>
			</li>
			<li>
				<label for="upload">파일업로드</label>
				<input type="file" name="upload" id="upload">
				<form:errors element="div" cssClass="error-color"/>
				<c:if test="${!empty reviewVO.r_imgname}">
				<div id="file_detail">
					(${reviewVO.r_imgname})파일이 등록되어 있습니다.
					<input type="button" value="파일삭제" id="file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'deleteFile.do',
									data:{r_num:${reviewVO.r_num}},
									type:'post',
									dataType:'json',
									success:function(param){
										if(param.result == 'logout'){
											alert('로그인 후 사용하세요');
										}else if(param.result == 'success'){
											$('#file_detail').hide();
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
				</script>
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="상세정보" onclick="location.href='detail.do?r_num=${reviewVO.r_num}'">
		</div>	                   
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->