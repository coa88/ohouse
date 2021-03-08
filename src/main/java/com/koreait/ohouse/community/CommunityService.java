package com.koreait.ohouse.community;

import org.springframework.stereotype.Service;

import com.koreait.ohouse.model.CommunityEntity;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityService {

	final CommunityMapper mapper;
	
	public int insBoard(CommunityEntity param) {
		return mapper.insBoard(param);
	}
}
