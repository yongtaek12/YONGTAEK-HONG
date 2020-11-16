package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.db.DBManager;
import com.example.demo.db.PostManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.PostVO;

@Repository
public class PostDAO {
	
	//寃뚯떆�뙋 �쟾泥� 寃뚯떆湲��닔
	public int getTotalCount(HashMap map) {
		return PostManager.getTotalCount(map);
	}	
	
	//寃뚯떆�뙋 �쟾泥닿� 媛��졇�삤湲�
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	
	//寃뚯떆湲� �긽�꽭蹂닿린
	public PostVO findById(HashMap map) {
		return PostManager.findById(map);
	}
	
	//寃뚯떆湲� 議고쉶�닔
	public int updateHit(int p_id) {
		return PostManager.updateHit(p_id);
	}
	
	//�깉湲� 踰덊샇 遺덈윭�삤湲�
	public int getNextId(int group) {
		return PostManager.getNextId(group);
	}
	//�깉湲� 踰덊샇 遺덈윭�삤湲�
	public int getNextNo(int group) {
		return PostManager.getNextNo(group);
	}
	//�깉湲� �옉�꽦
	public int insert(HashMap map) {
		return PostManager.insert(map);
	}
	
	//湲� �닔�젙
	public int update(PostVO p) {
		return PostManager.update(p);
	}
	
	//湲� �궘�젣
	public int delete(HashMap map) {
		return PostManager.delete(map);
	}
	
	// �솃�솕硫댁뿉�꽌 而ㅻ�ㅻ땲�떚 �겢由� or 怨듭��궗�빆�쑝濡� �씠�룞[�옱�꽦]
		public List<PostVO> getpostList(Map map) {
			return DBManager.getpostList(map);
		}
	
	// �럹�씠吏� 泥섎━ �떆 珥� 寃뚯떆臾� 紐⑸줉�쓣 諛쏆븘�삤�뒗 硫붿냼�뱶[�옱�꽦]
	public int getTotalCount(Map map) {
		return DBManager.getTotalCount(map);
	}
	//용택 포스트 추가
	public int insert2(PostVO p) {
		return PostManager.insert2(p);
	}
	//내서재 목록 출력
	public List<PostVO> My_list(HashMap map){
		return PostManager.My_list(map);
	}
	
}
