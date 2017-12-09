package com.caitou.service.base.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.caitou.service.base.BaseService;
import com.github.abel533.mapper.Mapper;

public class BaseServiceImpl<T> implements BaseService<T> {
	
	@Autowired
	private Mapper<T> mapper;

	@Override
	public T selectOne(T record) {
		return mapper.selectOne(record);
	}

	@Override
	public List<T> select(T record) {
		return mapper.select(record);
	}

	@Override
	public int selectCount(T record) {
		return mapper.selectCount(record);
	}

	@Override
	public T selectByPrimaryKey(Object key) {
		return mapper.selectByPrimaryKey(key);
	}

	@Override
	public int insert(T record) {
		return mapper.insert(record);
	}

	@Override
	public int insertSelective(T record) {
		return mapper.insert(record);
	}

	@Override
	public int delete(T record) {
		return mapper.delete(record);
	}

	@Override
	public int deleteByPrimaryKey(Object key) {
		return mapper.deleteByPrimaryKey(key);
	}

	@Override
	public int updateByPrimaryKey(T record) {
		return mapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeySelective(T record) {
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int selectCountByExample(Object example) {
		return mapper.selectCountByExample(example);
	}

	@Override
	public int deleteByExample(Object example) {
		return mapper.deleteByExample(example);
	}

	@Override
	public List selectByExample(Object example) {
		return mapper.selectByExample(example);
	}

	@Override
	public int updateByExampleSelective(T record, Object example) {
		return mapper.updateByExampleSelective(record, example);
	}

	@Override
	public int updateByExample(T record, Object example) {
		return mapper.updateByExample(record, example);
	}

}
