package com.spm.service;

import java.util.List;

import com.spm.model.Word;


public interface WordService {

	public List toSeachCELike(Word word);
	
	public int insertWord(Word word);
	
	public int updateWord(Word word);
	
	public Word findWordById(Integer id);
	
	public int delWord(Word word);
}
