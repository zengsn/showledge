package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.entity.Essay;

@Repository
public interface IEssayDao {

	public void insertEssay(Essay essay);

	public void updateEssayById(Essay essay);

	public Essay selectEssayById(String id);

	public List<Essay> selectAllEssay();

	public List<Essay> selectEssayByCorpusId(Essay essay);
	
	public void deleteEssayById(Essay essay);
	
	public void deleteEssayByCorpusId(Essay essay);
}
