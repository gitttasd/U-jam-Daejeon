package com.springmvc.food;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.attach.AttachDao;
import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;
import com.springmvc.comm.SearchVo;
import com.springmvc.foodattach.FoodAttachDao;
import com.springmvc.foodattach.FoodAttachVo;
import com.springmvc.foodreply.FoodReplyDao;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodDao foodDao;
	
	@Autowired
	private FoodReplyDao foodReplyDao;
	
	@Autowired
	private FoodAttachDao foodAttachDao;
	
	@Value("${bbs.upload}")
	private String uploadDir;
	
	
	@Override
	public List<FoodVo> findPn(SearchVo searchVo) {
		
		List<FoodVo> pn = foodDao.findPn(searchVo);
		
		for(FoodVo fd : pn) {
			 Float rating = foodReplyDao.avgRatingForFood(fd.getFoodBbsNo());
			 fd.setRating(rating);
		 }
		
		return pn;
	}

	@Override
	public int countBbs(SearchVo searchVo) {
		return foodDao.countBbs(); 
	}

	@Override
	public List<FoodAttachVo> findattName(int FoodBbsNo) {
		return foodDao.findattName(FoodBbsNo);
	}
	
	@Override
	public void incrementViewCount(int foodBbsNo) {
		foodDao.incrementViewCount(foodBbsNo);	
	}
	
	
	
	@Transactional
	@Override
	public int addBbs(FoodVo vo) {
		int num = foodDao.addBbs(vo);
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
				
			try { 
				 FileCopyUtils.copy(mf.getBytes() ,new File(
				 "c:/Temp/upload2"
				 ,newFileName));
			
				FoodAttachVo avo = new FoodAttachVo();
				avo.setFoodAttName(mf.getOriginalFilename());
				avo.setFoodAttNewName(newFileName);
				avo.setFoodAttBbsNo(vo.getFoodBbsNo());
				foodAttachDao.adfoodatt(avo);
				
			} catch(IOException e){
				e.printStackTrace();
				throw new RuntimeException(e);
			}	
			}
		}
		return num;
	}

	@Override
	public FoodVo findByNo(int foodBbsNo) {
		
		return foodDao.findByNo(foodBbsNo);
	}

	// 게시글 업데이트
	@Override
	@Transactional
	public int updateBbs(FoodVo vo) {
		
		/*게시글 수정*/
		int num = foodDao.updateBbs(vo);
		
		/*게시글 첨부파일 삭제 시*/
		List<Integer> deleteAttIds = vo.getDeleteAttIds();
	    if (deleteAttIds != null && !deleteAttIds.isEmpty()) {
	        for (Integer foodAttNo : deleteAttIds) {
	            FoodAttachVo attach = foodAttachDao.findAttach(foodAttNo);
	            if (attach != null) {
	                File file = new File(uploadDir, attach.getFoodAttNewName());
	                if (file.exists()) {
	                    file.delete();
	                }
	                foodAttachDao.delete(foodAttNo);
	            }
	        }
	    }
	    /*게시글 첨부파일 추가 시*/
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
				
				
			try { 
				 FileCopyUtils.copy(mf.getBytes() ,new File(
						 "c:/Temp/upload2"
				 ,newFileName));
			
				FoodAttachVo avo = new FoodAttachVo();
				avo.setFoodAttName(mf.getOriginalFilename());
				avo.setFoodAttNewName(newFileName);
				avo.setFoodAttBbsNo(vo.getFoodBbsNo());
				foodAttachDao.adfoodatt(avo);
				
			} catch(IOException e){
				e.printStackTrace();
				throw new RuntimeException(e);
			}	
			}
		}
		return num;
	}	
	
	@Transactional
	@Override
	public int deleteBbs(int foodBbsNo) {
		List<FoodAttachVo> vo = foodDao.findattName(foodBbsNo);
		 if (vo != null && !vo.isEmpty()) {
		        for (FoodAttachVo attach : vo) {
		                File file = new File(uploadDir, attach.getFoodAttNewName());
		                
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
		                	foodAttachDao.delete(attach.getFoodAttNo());
		                } catch (Exception e) {
		                    // 데이터베이스 삭제 실패 시 예외를 발생
		                    throw new RuntimeException("Failed to delete attachment with ID: " + attach.getFoodAttNo(), e);
		                }
		            }
		        }

		        // 게시글을 삭제.
		        int result = foodDao.deleteBbs(foodBbsNo);
		        
		        // 게시글 삭제 실패 시 예외를 발생.
		        if (result == 0) {
		            throw new RuntimeException("Failed to delete board with ID: " + foodBbsNo);
		        }

		        return result;
	}
	
	@Override
	public List<FoodVo> findHomeBbs(int end) {
		return foodDao.findHomeBbs(end);
	}
	
	@Override
	public FoodAttachVo findFirstAttachmentByBbsNo(int foodBbsNo) {
	
		return foodDao.findFirstAttachmentByBbsNo(foodBbsNo);
	}

	@Override
	public Float avgByNo(int foodBbsNo) {
		return foodReplyDao.avgByNo(foodBbsNo);
	}

	@Override
	public FoodAttachVo findAttach(int foodAttNo) {
		return foodAttachDao.findAttach(foodAttNo);
	}

	@Override
	public File getAttachFile(String foodAttNewName) {
			return new File("c:/Temp/upload2",foodAttNewName);
		
	}

	

	
	
	
}


