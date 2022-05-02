package com.kmong.paging;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PageImpl<T> implements Paging<Object> {
	private int gtp;
	private int gpp;
	private int firstPage;
	private int lastPage;
	private int totalRecord;
	private int param;
	private List<Object> VOList;
	private int pagePerRecord;
	private HttpServletRequest request;
	


	/**
	 * �⺻ �����ڷ� request, DAO�� ���� VOList�� �Ķ���ͷ� �Է�
	 * @param request
	 * @param VOList
	 */
	public PageImpl(HttpServletRequest request,List<Object> VOList) {
		this.request = request;
		
		this.gpp = 10;
		this.pagePerRecord=10;
		this.totalRecord = VOList.size();
		this.VOList = VOList;
		this.gtp=(totalRecord/pagePerRecord)+1;
		this.param = getParam(request);
		this.firstPage = this.getFirstPage();
		this.lastPage = this.getLastPage();
	}
	public PageImpl(HttpServletRequest request,List<Object> VOList,int pagePerRecord) {
		this.request = request;
		
		this.gpp = 10;
		this.pagePerRecord=pagePerRecord;
		this.totalRecord = VOList.size();
		this.VOList = VOList;
		this.gtp=(totalRecord/pagePerRecord)+1;
		this.param = getParam(request);
		this.firstPage = this.getFirstPage();
		this.lastPage = this.getLastPage();
	}
	
	/**
	 * �Ķ���� ��ȿ�� ����
	 * @param request
	 * @return
	 */
	private int getParam(HttpServletRequest request) {
		
		if (request.getParameter("p") == null) {
			return 1;
		} 
		if (Integer.parseInt(request.getParameter("p")) > this.getTotalPage()) {
			
			return this.gtp;
		}
		this.param = Integer.parseInt(request.getParameter("p"));
		return Integer.parseInt(request.getParameter("p"));	
	}

	/**
	 * �ѹ��� ������ ������ �׷� ���� ����
	 * @param num
	 */
	public void setGroupPerPage(int num) {
		this.gpp = num;
		
	}

	/**
	 * �� �������� ������ �Խñ� ���� ����
	 * @param num
	 */
	public void setPagePerRecord(int num) {
		this.pagePerRecord = num;
		this.gtp=(totalRecord/pagePerRecord)+1;
		
	}

	
	


	/**
	 *�� �������� ù��° ���������� ���
	 */
	@Override
	public int getFirstPage() {
		
		int result = param / this.gpp;				
		if(param%this.gpp!=0) {
			this.firstPage=result*this.gpp+1;
			return result*this.gpp+1;
		}
		this.firstPage=(result-1)*this.gpp+1;
		return (result-1)*this.gpp+1;		
	}
	
	/**
	 *�� ������ ������ ������ ���
	 */
	@Override	
	public int getLastPage() {
		
		int result = param / this.gpp;
		if(param%this.gpp ==0) {
			result -= 1;
		}
		
		if(this.gtp / this.gpp >  result) {
			this.lastPage = this.gpp * (result+1);
			return this.gpp * (result+1);
		}
		
		this.lastPage = (this.gtp % this.gpp)+this.gpp*(result);
		return (this.gtp % this.gpp)+this.gpp*(result);
	}

	/**
	 *next��ư ������ �� ������ ���
	 */
	@Override
	public int getNextPage() {		
		return this.lastPage+1;
	}
	
	/**
	 *prev��ư ������ �� ������ ���
	 */
	@Override
	public int getPrevPage() {		
		return this.firstPage-1;
	}
	
	/**
	 *next ��ư ���ǹ�
	 */
	@Override
	public boolean isNextPage() {
		return this.gtp-this.lastPage>0;
	}

	/**
	 *prev ��ư ���ǹ�
	 */
	@Override
	public boolean isPrevPage() {
		return this.firstPage != 1;
	}

	/**
	 *�� �������� �Խñ� �ø���
	 */
	@Override
	public List<Object> getVoAsPagePerRecord() {
		param = getParam(request);
		param-=1;
		
		if(param*pagePerRecord+pagePerRecord > this.totalRecord) {
			
			return VOList.subList(param*pagePerRecord, VOList.size());
		}
		return VOList.subList(param*pagePerRecord, param*pagePerRecord+pagePerRecord);
	}
	
	
	/**
	 * �� ������ ��
	 * @return
	 */
	@Override
	public int getTotalPage() {
		this.gtp=(totalRecord/pagePerRecord)+1;
		return gtp;
	}


	
}

