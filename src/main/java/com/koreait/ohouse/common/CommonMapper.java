package com.koreait.ohouse.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.MenuEntity;

@Mapper
public interface CommonMapper {
	List<MenuEntity> selMenuList();
	List<MenuEntity> selSubmenuList();
}
