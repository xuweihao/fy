package com.spm.dao;

import java.util.List;

public interface BaseMapper<T,PK> {
	/**
	 * ͨ��id��ѯ
	 * @param id
	 * @return
	 */
	public T findEntityById(PK id);
	
	/**
	 * ��ѯ����
	 * @param obj
	 * @return
	 */
	public Integer findCount(T t);
	
	
	/**
	 * ��ѯȫ��
	 * @param obj
	 * @return
	 */
	public List<T> findEntity(Object obj);
	
	
	/**
	 * ������ѯ
	 * @param obj
	 * @return
	 */
	public List<T> findLikeEntity(Object obj);
	
	
	/**
	 * ����
	 * @param t
	 */
	public int insertEntity(T t);
	
	
	/**
	 * ����
	 * @param t
	 */
	public int updateEntityById(T t);
	
	
	/**
	 * ͨ��idɾ��
	 * @param id
	 */
	public int deleteEntityById(Object obj);
	
	
	/**
	 * ����ɾ��
	 * @param obj
	 */
	public int deleteEntityByCondition(Object obj);
	
}
