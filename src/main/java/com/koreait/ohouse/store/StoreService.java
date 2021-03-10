package com.koreait.ohouse.store;

import org.springframework.stereotype.Service;

import com.koreait.ohouse.model.StoreEntity;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {
	final StoreMapper mapper;
	 
	public StoreEntity selPdBoard(StoreEntity p) {
		return mapper.selPdBoard(p); 
	}
}
