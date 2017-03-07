package h.h.ajax1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import h.h.ajax1.dao.customerDAO;
import h.h.ajax1.vo.Customer;

@Repository
public class customerRepository {

	@Autowired
	SqlSession sqlSession;

	public int insert(Customer customer) {
		customerDAO dao = sqlSession.getMapper(customerDAO.class);
		int result = 0;
		try {
			result = dao.insert(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
