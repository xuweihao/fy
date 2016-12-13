package com.spm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spm.dao.WordDao;
import com.spm.model.Word;
import com.spm.service.WordService;
@Service(value="wordService")	
public class WordServiceImpl implements WordService {

	@Resource(name="wordDao")
	private WordDao wordDao;

	public List toSeachCELike(Word word) {
		List list  =wordDao.findLikeEntity(word);
		return list==null?new ArrayList():list;
	}

	public int insertWord(Word word) {
		return wordDao.insertEntity(word);
	}

	public int updateWord(Word word) {
		return wordDao.updateEntityById(word);
	}

	public Word findWordById(Integer id) {
		Word word = wordDao.findEntityById(id);
		return word;
	}

	public int delWord(Word word) {
		return wordDao.deleteEntityById(word);
	}
}
