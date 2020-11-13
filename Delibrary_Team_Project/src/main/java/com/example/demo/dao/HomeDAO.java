package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.PostVO;

@Repository
public class HomeDAO {
   
   // Ȩȭ�� �缭��õ���� ����Ʈ �̾ƿ���  �޼ҵ�
   public List<BookVO> getStaffRecommend() {
      return DBManager.getStaffRecommend();
   }
   
   // Ȩȭ�� ���۵��� ����Ʈ �̾ƿ��� �޼ҵ�
   public List<BookVO> getNewRecommend() {
      return DBManager.getNewRecommend();
   }
   
   // Ȩȭ�鿡 �Խñ� ����Ʈ �̾ƿ��� �޼ҵ�
   public List<PostVO> getHomePost(int group) {
      return DBManager.getHomePost(group);
   }
}