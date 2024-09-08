package com.springmvc.bbs;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachDao;
import com.springmvc.attach.AttachVo;
import com.springmvc.comm.SearchVo;
import com.springmvc.reply.ReplyDao;




@Service

public class BbsServiceImpl implements BbsService {

	@Autowired
	private BbsDao bbsDao;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Value("${bbs.upload}")
	private String uploadDir;
	
	@PostConstruct
	public void init() {
		new File(uploadDir).mkdirs();
	}
	

	 @Override public List<BbsVo> findPn(SearchVo searchVo) { 
	
		 List<BbsVo> pn = bbsDao.findPn(searchVo); 
	 
	     /* 별점정보 가져오기 */
		 for(BbsVo bbs : pn) {
			 Float rating = replyDao.avgRatingForBbs(bbs.getBbsNo());
			 bbs.setRating(rating);
		 }
	 
	 	return pn;
	 }
	  
	 @Override public int countBbs(SearchVo searchVo) { 
		 return bbsDao.countBbs(); 
	}
	 

	@Override
	public BbsVo findByNo(int bbsNo) {
		
		return bbsDao.findByNo(bbsNo);
	}

	@Transactional
	@Override
	public int addBbs(BbsVo vo) {
		
		int num = bbsDao.addBbs(vo);
		List<MultipartFile>upfileList = vo.getUpfilelist();
		if(upfileList!=null) {
			for(MultipartFile mf : upfileList) {
				if(mf ==null || mf.getSize()<= 0) continue;
				
				String newFileName;
				File nf;
				
				do {
					newFileName= UUID.randomUUID().toString(); 
					nf = new File(uploadDir,newFileName);
				}while(nf.exists());
				
				
				   //FileCopyUtils 클래스의 copy 매서드를 활용하여 파일의 내용을 복사 처음 매개변수 바이트 변수 , 두번째 복사 대상 파일객체
				  //new File("c:/Temp/upload",newFileName)); 새 파일 객체 생성 및 경로 새파일 이름 
			try { //mf.getBytes() 첨부파일의 내용을 바이트 배열로 읽어 옴  
				/* FileCopyUtils.copy(mf.getBytes(),new File("c:/Temp/upload",newFileName)); */
			
				 FileCopyUtils.copy(mf.getBytes() ,new File(
						 "c:/Temp/upload" ,newFileName));
			
				AttachVo avo = new AttachVo();
				avo.setAttName(mf.getOriginalFilename());
				avo.setAttNewName(newFileName);
				avo.setAttBbsNo(vo.getBbsNo());
				attachDao.add(avo);
				
			} catch(IOException e){
				e.printStackTrace();
				throw new RuntimeException(e);
			}	
			}
		}
		return num;
	}	
	
	/* 수정 매서드 */
	@Override
	@Transactional
	public int updateBbs(BbsVo vo) {
		
		int num = bbsDao.updateBbs(vo);
		List<Integer> deleteAttIds = vo.getDeleteAttIds();
	    if (deleteAttIds != null && !deleteAttIds.isEmpty()) {
	        for (Integer attNo : deleteAttIds) {
	            AttachVo attach = attachDao.findAttach(attNo);
	            if (attach != null) {
	                File file = new File(uploadDir, attach.getAttNewName());
	                if (file.exists()) {
	                    file.delete();
	                }
	                attachDao.delete(attNo);
	            }
	        }
	    }
		List<MultipartFile>upfileList = vo.getUpfilelist();
		if(upfileList!=null) {
			for(MultipartFile mf : upfileList) {
				if(mf ==null || mf.getSize()<= 0) continue;
				
				String newFileName;
				File nf;
				
				do {
					newFileName= UUID.randomUUID().toString(); 
					nf = new File(uploadDir,newFileName);
				}while(nf.exists());
				
				
				   //FileCopyUtils 클래스의 copy 매서드를 활용하여 파일의 내용을 복사 처음 매개변수 바이트 변수 , 두번째 복사 대상 파일객체
				  //new File("c:/Temp/upload",newFileName)); 새 파일 객체 생성 및 경로 새파일 이름 
			try { //mf.getBytes() 첨부파일의 내용을 바이트 배열로 읽어 옴  
				/* FileCopyUtils.copy(mf.getBytes(),new File("c:/Temp/upload",newFileName)); */
			
				 FileCopyUtils.copy(mf.getBytes() ,new File(
				 "c:/Temp/upload"
				 ,newFileName));
			
				AttachVo avo = new AttachVo();
				avo.setAttName(mf.getOriginalFilename());
				avo.setAttNewName(newFileName);
				avo.setAttBbsNo(vo.getBbsNo());
				attachDao.add(avo);
				
			} catch(IOException e){
				e.printStackTrace();
				throw new RuntimeException(e);
			}	
			}
		}
		return num;
	}	

	/* 삭제 매서드 */
	@Transactional 
	@Override
	 public int deleteBbs(int bbsNo) {
	 
		 List<AttachVo> vo = bbsDao.findattName(bbsNo);
		 if (vo != null && !vo.isEmpty()) {
		        for (AttachVo attach : vo) {
		                File file = new File(uploadDir, attach.getAttNewName());
		                
		                //파일이 존재 시 삭제
		                if (file.exists()) {
		                	boolean fileDeleted = file.delete();
		                	if(!fileDeleted) {
		                		// 데이터베이스 삭제 실패 시 예외를 발생
		                		throw new RuntimeException("Failed to delete file: " + file.getAbsolutePath());
		                	}	
		                }
		                
		                // 데이터베이스에서 첨부파일 정보를 삭제
		                try {
		                    attachDao.delete(attach.getAttNo());
		                } catch (Exception e) {
		                    // 데이터베이스 삭제 실패 시 예외를 발생
		                    throw new RuntimeException("Failed to delete attachment with ID: " + attach.getAttNo(), e);
		                }
		            }
		        }

		        // 게시글을 삭제.
		        int result = bbsDao.deleteBbs(bbsNo);
		        
		        // 게시글 삭제 실패 시 예외를 발생.
		        if (result == 0) {
		            throw new RuntimeException("Failed to delete board with ID: " + bbsNo);
		        }

		        return result;
		    }
	
	@Override
	public void incrementViewCount(int bbsNo) {
		 bbsDao.incrementViewCount(bbsNo);
		
	}

	@Override
	public List<AttachVo> findattName(int bbsNo) {
	    return attachDao.findattName(bbsNo);
	}
	
	@Override
	public AttachVo findAttach(int attNo) {
		
		return attachDao.findAttach(attNo);
	}
	@Override
	public File getAttachFile(String attNewName) {
		
		return new File(uploadDir,attNewName);
	}

	@Override
	public List<BbsVo> findHomeBbs(int end) {
		return bbsDao.findHomeBbs(end);
	}

	@Override
	public AttachVo findFirstAttachmentByBbsNo(int bbsNo) {
		 return bbsDao.findFirstAttachmentByBbsNo(bbsNo);
	}


	@Override
	public Float avgByNo(int bbsNo) {
		return replyDao.avgByNo(bbsNo);
	}
	
	@Override
	public List<BbsVo> findAll(SearchVo searchVo) {
		return bbsDao.findAll(searchVo);
	}

	
}
