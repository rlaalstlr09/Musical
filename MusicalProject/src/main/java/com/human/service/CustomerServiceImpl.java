
package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.human.dao.ICustomerDao;
import com.human.dto.CustomerDto;
import com.human.dto.MusicalDto;
import com.human.vo.BoardVo;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
    PasswordEncoder passwordEncoder;
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CustomerDto> selectAll() throws Exception {

		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);

		List<CustomerDto> dtos = dao.selectAll();

		return dtos;
	}
	
	@Override
	public void insert(CustomerDto dto) throws Exception {
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		dao.insert(dto);
	}
	
	@Override
	public void update(CustomerDto dto) throws Exception {
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		dao.update(dto);
	}
	
	@Override
	public void pwUpdate(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		dao.pwUpdate(dto);
	}

	@Override
	public void delete(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		dao.delete(dto);
	}
	
	@Override
	public CustomerDto selectName(String customer_id) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.selectName(customer_id);
	}
	
	@Override
	public boolean selectId(String customer_id) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.selectId(customer_id);
	}

	// 아이디 찾기
	@Override
	public List<CustomerDto> findCustomerId(String customer_email) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.findCustomerId(customer_email);
	}
	@Override
	public List<CustomerDto> findCustomerIdPhone(String customer_phone) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.findCustomerIdPhone(customer_phone);
	}
	
	// 비번 재발급
	@Override
	public void newPwUpdate(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		String newUpdatePw = passwordEncoder.encode(dto.getCustomer_pw());
		dto.setCustomer_pw(newUpdatePw);
		dao.newPwUpdate(dto);
	}
	
	@Override
	public int pwCheck(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.pwCheck(dto);
	}
	
	@Override
	public void newPwUpdatePhone(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		String newUpdatePw = passwordEncoder.encode(dto.getCustomer_pw());
		dto.setCustomer_pw(newUpdatePw);
		dao.newPwUpdatePhone(dto);
	}
	
	@Override
	public int pwCheckPhone(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.pwCheckPhone(dto);
	}
	
	@Override
	public CustomerDto nowPwCheck(String customer_id) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.nowPwCheck(customer_id);
	}
	//장바구니
	@Override
	public List<MusicalDto> selectMusicalsLike(String customer_id) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.selectMusicalsLike(customer_id);
	}
//	@Override
//	public void authoritiesUpdate(CustomerDto dto) throws Exception{
//		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
//		dao.authoritiesUpdate(dto);
//	}
	
	//관리자 관련
	public List<CustomerDto> customer_listSearch(BoardVo vo) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.customer_listSearch(vo);
	}
	
	public int customer_listSearchCount(BoardVo vo) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		return dao.customer_listSearchCount(vo);
	}
	
	public void enabledUpdate(CustomerDto dto) throws Exception{
		ICustomerDao dao = sqlSession.getMapper(ICustomerDao.class);
		dao.enabledUpdate(dto);
	}
}
