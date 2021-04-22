package mall.client.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") // 모든요청 가로채기
public class EncodingFilter implements Filter {
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//1. request 파라미터를 이용해 요청의 필터 작업 수행
		request.setCharacterEncoding("utf-8");
		System.out.println("필터실행");
        //2. 체인의 다음 필터 처리
		chain.doFilter(request, response); // 3. response를 이용해 응답의 필터링 작업
	}
}
