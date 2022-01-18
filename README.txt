<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	1. window/preferences에서 html, jsp 파일 생성 메뉴가 보이지 않을때
		=> Help > eclipse Marketplace... 창에서  Java and Web 으로 검색하면 나온다.
			Eclipse Enterprise JAVA and WEB ... 이것을 설치해 주면 된다.
	
	2. STS에서 Application 실행방법 : Boot dashboard 괜찮아 보이네.
	
	3. STS에서 jsp 사용
		pom.xml > dependancies >Add > tomcat embed jasper 검색
		
	4. [Maven] dependancy 추가시 에러처리 index downloads are disabled search results may be incomplete
		1) Windows > Preferences 에서 Maven 탭에서
			Download repository index updates on startup
			Download Artifact Sources
			Download Artifact JavaDoc를 체크 하고, 이클립스를 재시작 하면 된다. 
		2) Window > Show view > Other > Maven > Maven Repositories 선택 > Global Repositories 우클릭 > (Re)Build index
			
	5. jasper Maven 설치
	 	- maven repository 검색해서
	 	- tomcat embed jasper
	 	<!-- https://mvnrepository.com/artifact/org.apache.tomcat.embed/tomcat-embed-jasper -->
	 	<dependency>
		    <groupId>org.apache.tomcat.embed</groupId>
		    <artifactId>tomcat-embed-jasper</artifactId>
		    <version>10.0.14</version>
		</dependency>
		
	6. <version>10.0.14</version>에 노란색 underline
		- Overriding managed version 9.0.56 for tomcat-embed-jasper
		- 위의 라인 삭제해도 된다.
		
	7. o.s.w.s.r.ResourceHttpRequestHandler  "Path with "WEB-INF" or "META-INF": [WEB-INF/view/customer/notice/list]"
		- 문제: jsp 파일을 찾을 수 없음
		- 원인: 내장된 tomcat에 jsp를 처리하는 서블릿이 없음
		- 해결: build.gradle이나 pom.xml 등에 jsp 처리하는 서블릿을 추가해주고 refresh
		- spring.mvc.view.suffix=.jsp 잘 처리되지 않아 헤멘 기억...(원인 미상 - 몇 번을 반복 수정하니 되었다.)
		
	8. Tiles
		- https://tiles.apache.org/framework/tutorial/basic/pages.html
		
	9. View Table 생성
	/*
	 * SELECT * FROM notice 
	 * SELECT * FROM member
	 * 
	 * 위의 두개 테이블을 JOIN 하여 새로운 NoticeView 테이블 생성
	 * 
	 * CREATE VIEW NoticeView 
	 * as 
	 * SELECT n.*, m.name memberName from notice n JOIN
	 * member m ON n.writerId = m.id
	 */
	 
	 10. Query 한 필드명이 DAO에서 정의한 필드명과 일지하지 않을때 처리 방법
	 	NoticeDAO.java에서 처럼 @Result를 이용하면 된다.
	 	@Result(property="memberName", column="member_name")
		
	 	- 여러개의 필드명이 다를 경우
		@Results{
			@Result(property="regDate", column="reg_date"),
			@Result(property="memberName", column="member_name")
		}
		
	11. MyBatis 참조
		https://mybatis.org/mybatis-3/ko/getting-started.html 에서
			"매핑된 SQL 구문 살펴보기" 아래부분 복사하여 NoticeDaoMapper.xml에 붙여넣기한다.
	
	12. MyBatis xml 파일에서 assistant 기능이 안될때.
		- eclipse marketpace에서 XML 검색.
		- Eclipse XML Editor and Tools 설치하면 된다.
		
	13. MyBatis 동적 Query 작성
		https://mybatis.org/mybatis-3/ko/dynamic-sql.html
		- if, foreach, choose, trim,...
		- <trim prefix="WHERE" prefixOverrides="AND |OR "></trim>
		
	14. JUnit 테스트
		- "spring boot mybatis test" 조회
		- NoticeDao.java > 우클릭 > New > Other > JUnit > JUnit Test Case > Finish
		- NoticeDaoTest.java 생성
		- NoticeDao.java > 우클릭 > Run As > JUnit Test
		
	15. Mapper.xml에서 칼럼명이 DB와 DAO가 다를때
		<ResultMap type="com.newlecture.web.entry.NoticeView" id="noticeViewMap">
			<result property="memberName" column="member_name" />
		</ResultMap>
		
	16. Mybatis 오류
		Invalid bound statement (not found): com.newlecture.web.dao.NoticeDao.getViewList
		=> mybatis.mapper-locations:classpath:com/newlecture/web/dao/mybatis/mapper/*.xml 지정 오류
	
	</script>
</body>
</html>