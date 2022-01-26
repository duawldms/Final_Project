package com.jhta.project.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.MainMapper;
import com.jhta.project.vo.user.CategoryVo;

@Service
public class CategoryService {
	@Autowired private MainMapper mapper;
	public int categoryUpload(CategoryVo vo) {
		return mapper.categoryUpload(vo);
	}
	
}
