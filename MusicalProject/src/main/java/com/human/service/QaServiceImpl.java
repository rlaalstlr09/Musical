package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.human.dao.QaDao;
import com.human.dto.CustomerDto;
import com.human.dto.QaDto;
import com.human.vo.BoardVo;
@Service
public class QaServiceImpl implements IQaService {
	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(QaDto board) throws Exception {
		System.out.println(sqlSession);
		QaDao dao=sqlSession.getMapper(QaDao.class);
		dao.create(board);

	}

	@Override
	public QaDto read(int qa_id) throws Exception {
		QaDao dao=sqlSession.getMapper(QaDao.class);

		return dao.read(qa_id);
	}

	@Override
	public void modify(QaDto board) throws Exception {
		QaDao dao=sqlSession.getMapper(QaDao.class);
		dao.update(board);
	}
	
	@Override
	public void deleteAll(CustomerDto dto) throws Exception{
		QaDao dao = sqlSession.getMapper(QaDao.class);
		dao.deleteAll(dto);
	}
	
	@Override
	public List<QaDto> qa_list(BoardVo vo, String customer_id) throws Exception{
		QaDao dao = sqlSession.getMapper(QaDao.class);
		return dao.qa_list(vo, customer_id);
	}
	
	@Override
	public int qa_listCount(String customer_id)throws Exception{
		QaDao dao = sqlSession.getMapper(QaDao.class);
		return dao.qa_listCount(customer_id);
	}
	
//	트렌젝션 시 발생하는 3가지 현상?
//			dirty read : commit하지 않은 데이터에 대한 접근
//
//			non-repeatable Read 한 트렌젝션안에서 같은 쿼리를 실행했는데 결과가 다르게 나오는 비일관성 발생.
//			(중간에 다른 트렌젝션이 데이터를 변경시켜버림)
//
//			phantom read
//			데이터를 2번 이상 읽을때 첫번째에서 없던 데이터가 두번째에서 발생
//			중간에 다른 트렌젝션이 데이터를 삽입시켜버림
//
//			3가지현상을 방지하기 위한 Isolation level설정
//			레벨 0(READ_uncommitted)
//			:트랜젝션에서 커밋되지 않은 처리중인 데이터를 다른 트렌젝션에서 읽는 것을 허용
//			(DirtyRead,Non-Repeatable Read,PhantomRead 현상 발생)
//
//			레벨 1(READ_Committed)
//			:트랜젝션에서 커밋된 데이터만 다른 트렌젝션에서 읽는 것을 허용,디폴트값
//			(non-repeatableRead,Phantom Read 현상발생)
//
//			레벌 2(REPEATABLE_READ)
//			:트렌젝션에서 읽은 데이터는 종료될때까지 다른 트렌젝션이 수정 삭제를 못하게 막음.
//
//			레벌 3(Serializable_read)
//			:트렌젝션에서 읽은 데이터는 종료될때까지 다른 트렌젝션이 수정 삭제를 못하게 막고 입력도 막음
//			모든 트렌젝션이 완벽한 일기 일관성 모드를 제공
//
//			레벨이 높아질수록 데이터의 정확성 일관성이 높아지지 만 테이블 lock를 일정하게 발생시켜 동시성을 저하시킨다.
	//@Transactional
//	@Transactional(isolation=Isolation.READ_COMMITTED)

//	@Override
//	public List<BoardDTO> listSearchCriteria(BoardVo pm) throws Exception {
//		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
//		return dao.listSearch(pm);
//	}
//
//	@Override
//	public int listSearchCount(BoardVo pm) throws Exception {
//		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
//		return dao.listSearchCount(pm);
//	}
	
	
}
