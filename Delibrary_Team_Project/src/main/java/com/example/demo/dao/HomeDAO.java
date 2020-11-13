package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.PostVO;

@Repository
public class HomeDAO {
   
   // 홈화면 사서추천도서 리스트 뽑아오는  메소드
   public List<BookVO> getStaffRecommend() {
      return DBManager.getStaffRecommend();
   }
   
   // 홈화면 신작도서 리스트 뽑아오는 메소드
   public List<BookVO> getNewRecommend() {
      return DBManager.getNewRecommend();
   }
   
   // 홈화면에 게시글 리스트 뽑아오는 메소드
   public List<PostVO> getHomePost(int group) {
      return DBManager.getHomePost(group);
   }
}