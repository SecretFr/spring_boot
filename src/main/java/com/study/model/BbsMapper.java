package com.study.model;

import java.util.List;
import java.util.Map;

public interface BbsMapper {
	int total(Map map);
	List<BbsDTO> list(Map map);
	int create(BbsDTO dto);
    int upViewcnt(int bbsno);
    BbsDTO read(int bbsno);
    int update(BbsDTO dto);
    int passCheck(Map map);
    int delete(int bbsno);
    BbsDTO readReply(int bbsno);
    int upAnsnum(Map map);
    int createReply(BbsDTO dto);
    int checkRefnum(int bbsno);
}
