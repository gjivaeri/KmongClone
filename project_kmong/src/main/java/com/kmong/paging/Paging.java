package com.kmong.paging;

import java.util.List;

public interface Paging<T> {


	int getFirstPage();
	int getLastPage();
	boolean isNextPage();
	boolean isPrevPage();

	List<T> getVoAsPagePerRecord();
	int getNextPage();
	int getPrevPage();
	int getTotalPage();
	/**
	 * 한번에 보여줄 페이지 그룹 숫자 세팅
	 * @param num
	 */
	void setGroupPerPage(int num);
	/**
	 * 한 페이지에 보여줄 게시글 숫자 세팅
	 * @param num
	 */
	void setPagePerRecord(int num);




}
