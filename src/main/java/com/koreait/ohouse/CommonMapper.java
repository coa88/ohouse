package com.koreait.ohouse;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.MenuEntity;

@Mapper
public interface CommonMapper {
	List<MenuEntity> selMenuList();
}
