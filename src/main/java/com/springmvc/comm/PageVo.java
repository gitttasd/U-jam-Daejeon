package com.springmvc.comm;

public class PageVo {

		private int currentPageNo =1; //현재 페이지 번호
		private int recordCountPerPage =10; //한페이지당 레코드 개수
		private int pageSize =5; // page 이동하는 링크를 몇개를 출력할 것인지
		private int totalRecordCount; // 총 게시물 건수 
		
		

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

		//패이지 개수 계산
		public int getTotalPageCount() {
			 return ((getTotalRecordCount() - 1) / getRecordCountPerPage()) + 1;
			
		}

		// 예) 1 ~ 5 , 6~ 10
		//페이지 네이션 링크 리스트의 첫번째 번호 1,6
		public int getFirstPageNoOnPageList() {
			return ((getCurrentPageNo() - 1) / getPageSize()) * getPageSize() + 1;
			
		}
		
		//페이지 네이션 링크 리스트의 마지막 번호 5,10
		public int getLastPageNoOnPageList() {
			int lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;
			if (lastPageNoOnPageList > getTotalPageCount()) {
				lastPageNoOnPageList = getTotalPageCount();
			}
			return lastPageNoOnPageList;
		}

		//조회(select)할 때, 몇번 째 게시글 부터 가져올 것인지
		// 1page 1~10 2page 11
		public int getFirstRecordIndex() {
			return (getCurrentPageNo() - 1) * getRecordCountPerPage()+1;
		}

		//조회(select)할 때, 몇번 째 게시글 까지 가져올 것인지
		public int getLastRecordIndex() {
			return getCurrentPageNo() * getRecordCountPerPage();
			/*return  getFirstRecordIndex() + getRecordCountPerPage()-1;*/
		}


}
