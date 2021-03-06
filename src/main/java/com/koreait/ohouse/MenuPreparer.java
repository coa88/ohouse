package com.koreait.ohouse;

import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.koreait.ohouse.common.CommonMapper;
import com.koreait.ohouse.model.MenuEntity;


@Component("menuPreparer")
public class MenuPreparer implements ViewPreparer  {
	@Autowired
	private CommonMapper mapper;
	
	@Override
	public void execute(Request tilesContext, AttributeContext attributeContext) {		
		List<MenuEntity> menuList = null;
		List<MenuEntity> submenuList = null;
			System.out.println(" ----- get menus from DB -----");	
			menuList = mapper.selMenuList();
			submenuList = mapper.selSubmenuList();

		attributeContext.putAttribute("menuList", new Attribute(menuList), true);		
        attributeContext.putAttribute("submenuList", new Attribute(submenuList), true);		
	}
}
