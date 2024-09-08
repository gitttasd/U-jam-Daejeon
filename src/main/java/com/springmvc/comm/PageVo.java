package com.springmvc.comm;

public class PageVo {

		private int currentPageNo =1; //���� ������ ��ȣ
		private int recordCountPerPage =10; //���������� ���ڵ� ����
		private int pageSize =5; // page �̵��ϴ� ��ũ�� ��� ����� ������
		private int totalRecordCount; // �� �Խù� �Ǽ� 
		
		

		public int getCurrentPageNo() {
			return currentPageNo;
		}

		public void setCurrentPageNo(int currentPageNo) {
			this.currentPageNo = currentPageNo;
		}

		public int getRecordCountPerPage() {
			return recordCountPerPage;
		}

		public void setRecordCountPerPage(int recordCountPerPage) {
			this.recordCountPerPage = recordCountPerPage;
		}

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public int getTotalRecordCount() {
			return totalRecordCount;
		}

		public void setTotalRecordCount(int totalRecordCount) {
			this.totalRecordCount = totalRecordCount;
		}

		//������ ���� ���
		public int getTotalPageCount() {
			 return ((getTotalRecordCount() - 1) / getRecordCountPerPage()) + 1;
			
		}

		// ��) 1 ~ 5 , 6~ 10
		//������ ���̼� ��ũ ����Ʈ�� ù��° ��ȣ 1,6
		public int getFirstPageNoOnPageList() {
			return ((getCurrentPageNo() - 1) / getPageSize()) * getPageSize() + 1;
			
		}
		
		//������ ���̼� ��ũ ����Ʈ�� ������ ��ȣ 5,10
		public int getLastPageNoOnPageList() {
			int lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;
			if (lastPageNoOnPageList > getTotalPageCount()) {
				lastPageNoOnPageList = getTotalPageCount();
			}
			return lastPageNoOnPageList;
		}

		//��ȸ(select)�� ��, ��� ° �Խñ� ���� ������ ������
		// 1page 1~10 2page 11
		public int getFirstRecordIndex() {
			return (getCurrentPageNo() - 1) * getRecordCountPerPage()+1;
		}

		//��ȸ(select)�� ��, ��� ° �Խñ� ���� ������ ������
		public int getLastRecordIndex() {
			return getCurrentPageNo() * getRecordCountPerPage();
			/*return  getFirstRecordIndex() + getRecordCountPerPage()-1;*/
		}


}
