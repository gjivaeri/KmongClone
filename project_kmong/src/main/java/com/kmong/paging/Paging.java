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
	 * �ѹ��� ������ ������ �׷� ���� ����
	 * @param num
	 */
	void setGroupPerPage(int num);
	/**
	 * �� �������� ������ �Խñ� ���� ����
	 * @param num
	 */
	void setPagePerRecord(int num);




}
