package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.entity.Corpus;

@Repository
public interface ICorpusDao {

	public void insertCorpus(Corpus corpus);

	public List<Corpus> selectCorpusByUserName(Corpus corpus);

	public void deleteCorpusById(Corpus corpus);

	public void updateCorpusById(Corpus corpus);
}
