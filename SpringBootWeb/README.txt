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
		- https://attic.apache.org/
		- https://attic.apache.org/projects/tiles.html
		- https://tiles.apache.org/
		- https://tiles.apache.org/framework/tutorial/basic/pages.html
		- Extending Definitions
		
		- tiles 관련 lib
		<dependency>
		    <groupId>org.apache.tiles</groupId>
		    <artifactId>tiles-jsp</artifactId>
		    <version>3.0.8</version>
		</dependency>
			<dependency>
	        <groupId>javax.servlet</groupId>
	        <artifactId>jstl</artifactId>
	    </dependency>
		
		- TilesConfig.java	: TilesViewResolver 설정
		
	9. View Table 생성
	/*
	 * SELECT * FROM notice 
	 * SELECT * FROM user
	 * 
	 * 위의 두개 테이블을 JOIN 하여 새로운 NoticeView 테이블 생성
	 * 
	 * CREATE VIEW NoticeView 
	 * as 
	 * SELECT n.*, m.name userName from notice n JOIN
	 * user m ON n.writerId = m.id
	 */
	 
	 10. Query 한 필드명이 DAO에서 정의한 필드명과 일지하지 않을때 처리 방법
	 	NoticeDAO.java에서 처럼 @Result를 이용하면 된다.
	 	@Result(property="userName", column="user_name")
		
	 	- 여러개의 필드명이 다를 경우
		@Results{
			@Result(property="regDate", column="reg_date"),
			@Result(property="userName", column="user_name")
		}
		
	11. MyBatis 참조
		https://mybatis.org/mybatis-3/ko/getting-started.html 에서
			"매핑된 SQL 구문 살펴보기" 아래부분 복사하여 NoticeDaoMapper.xml에 붙여넣기 한다.
	
	12. MyBatis xml 파일에서 assistant 기능이 안될때.
		- eclipse marketpace에서 XML 검색.
		- Eclipse XML Editor and Tools 설치하면 된다.
		
	13. NoticeService
		-페이지를 요청할때
		 List<NoticeView> getViewList();
		 int getCount();
		 
		-검색을 요청할때
		 List<NoticeView> getViewList(String file, );
		 
		-페이지를 요청할때
		 List<NoticeView> getViewList(int page, );
		 int getCount(String field, String query);
		 
	    -일괄공개를 요청할때
	     int updatePubAll(int[] pubIds, int[] closel);
	    
	    -일괄삭제를 요청할때
	     int deleteAll(int[] ids);
	    
	    -자세한 페이지를 요청할때
	     NoticeView get(id);
	     Notice getNext(id);
	     Notice getPrev(id);
	     
	    -삭제를 요청할때
	     int update(Notice notice);
	     int delete(int id);
	     int insert(Notice notice);
		 
	14. MyBatis 동적 Query 작성
		https://mybatis.org/mybatis-3/ko/dynamic-sql.html
		- if, foreach, choose, trim,...
		- <trim prefix="WHERE" prefixOverrides="AND | OR "></trim>
		
	15. JUnit 단위 테스트
		- "mybatis spring boot test" 조회
		- maven "mybatis-spring-boot-starter-testmaven" 복사, 붙여넣기
		- NoticeDao.java > 우클릭 > New > Other > JUnit > JUnit Test Case > Finish
		- NoticeDaoTest.java 생성(Java perspective에서)
		- NoticeDaoTest.java > 우클릭 > Run As > JUnit Test
		
	16. Mapper.xml에서 칼럼명이 DB와 DAO가 다를때
		<ResultMap type="com.newlecture.web.entry.NoticeView" id="noticeViewMap">
			<result property="userName" column="user_name" />
		</ResultMap>
		
	17. Mybatis 오류
		Invalid bound statement (not found): com.newlecture.web.dao.NoticeDao.getViewList
		=> mybatis.mapper-locations:classpath:com/newlecture/web/dao/mybatis/mapper/*.xml 지정 오류
	
	18. 화면 접속 예
		http://localhost:8080/customer/notice/list, detail, reg, del
		http://localhost:8080/admin/board/notice/list, detail, reg, del
	
	19. newlectrue 기본 파일들은 /src/main/resources/static 아래에 복사해 두었다.
		기본적으로 SpringBoot의 home은 /src/main/resources/static, /src/main/webapp 모두 가능하다. static 아래에는 정적인 html 파일들을 배치하고 
		webapp 아래에는 동적인 jsp 파일들을 배치할 것이다.
		
	20. Dependancies 설치 방법
		Window > Show View > Others > Maven > Maven Repositories > Global Repositories > central 우클릭
		> Enable full index, Rebuild index 그리고 나면 
		pom.xml에서 Dependancies 탭에서 Add로 설정할 수 있다.
		
		MVN Repository 페이지 : Tomcat Embed jsper 검색
		
	21. log4jdbc logback 설정
		1) pom.xml
			<dependency> 
				<groupId>org.bgee.log4jdbc-log4j2</groupId>
				<artifactId>log4jdbc-log4j2-jdbc4.1</artifactId>
				<version>1.16</version>
			</dependency>
			
		2) log4jdbc.log4j2.properties
			log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator
			log4jdbc.dump.sql.maxlinelength=0
		
		3) application.properties
			spring.datasource.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy
			spring.datasource.url=jdbc:log4jdbc:mysql://localhost:3306/board?useSSL=false&characterEncoding=UTF-8&serverTimezone=Asia/Seoul
			spring.datasource.hikari.username=root
			spring.datasource.hikari.password=maria123
			spring.datasource.hikari.connection-test-query=SELECT NOW()
					
			logging.level.root=info
			logging.level.com.newlecture.web.test=info 
			logging.level.com.newlecture.web.test.controller=debug

			# 프로필 설정 
			spring.profiles.active=local
			
		4) logback-local.properties
			#로그 파일 경로
			log.config.path=C:/logs/local
	
			#로그 파일 이름
			log.config.filename=local_log
			
		5) logback-spring.xml
			<!-- SQL문만을 로그로 남기며, PreparedStatement일 경우 관련된 argument 값으로 대체된 SQL문이 보여진다. --> 
			<logger name="jdbc.sqlonly" level="debug"/> 
		
			<!-- SQL 결과 조회된 데이터의 table을 로그로 남긴다. --> 
			<logger name="jdbc.resultsettable" level="debug"/>
	22. console 오류 메시지
		DevTools failed to load source map: Could not load content for chrome-extension:
		//pgjjikdiikihdfpoppgaidccahalehjh/webspeed.js.map: System error: net::ERR_BLOCKED_BY_CLIENT
		
	23.
	</script>
</body>
</html>