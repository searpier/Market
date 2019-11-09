package carrot.market.test.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import carrot.market.test.model.Product;
import carrot.market.test.model.User;

/**
 * @Author : 전상수
 * @Date : 2019. 11. 08.
 * @Class 설명 : 당근마켓 Repo.
 * 
 */
@Repository
public class MarketRepository {

	@Autowired
	SqlSession sqlSession;

	/* 회원등록 */
	public int insertUser(User user) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		int result = 0;
		try {
			result = dao.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 회원로그인 */
	public User selectUser(User user) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		User result = null;
		try {
			result = dao.selectUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 상품등록 */
	public int insertProduct(Product product) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		int result = 0;
		try {
			result = dao.insertProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 차량등록 */
	public int insertCar(Product product) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		int result = 0;
		try {
			result = dao.insertCar(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 상품 전체 조회 */
	public List<Product> selectProducts() {

		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		List<Product> result = null;
		try {
			result = dao.selectProducts();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 일련번호로 상품조회 */
	public Product selectProductBySeq(String productSeq) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		Product result = null;
		try {
			result = dao.selectProductBySeq(productSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 일련번호로 차량조회 */
	public Product selectCarBySeq(String productSeq) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		Product result = null;
		try {
			result = dao.selectCarBySeq(productSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 필터조건으로 차량조회 */
	public List<Product> selectCarByFilter(HashMap<String, String> productSeq) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		List<Product> result = null;
		try {
			result = dao.selectCarByFilter(productSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	/* 카테고리로 상품조회 */
	public List<Product> selectProductByCategory(String category) {
		MarketDAO dao = sqlSession.getMapper(MarketDAO.class);
		List<Product> result = null;
		try {
			result = dao.selectProductByCategory(category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
