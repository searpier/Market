package carrot.market.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import carrot.market.test.model.Product;
import carrot.market.test.model.User;
import carrot.market.test.repository.MarketDAO;
import carrot.market.test.repository.MarketRepository;

/**
 * @Author : 전상수
 * @Date : 2019. 11. 08.
 * @Class 설명 : 당근마켓 서비스
 * 
 */
@Service
public class MarketService {

	@Autowired
	MarketRepository repo;

	/* 회원등록 */
	public int insertUser(User user) {
		return repo.insertUser(user);
	}

	/* 회원로그인 */
	public User selectUser(User user) {
		return repo.selectUser(user);
	}

	/* 상품등록 */
	public int insertProduct(Product product) {
		return repo.insertProduct(product);
	}

	/* 차량등록 */
	public int insertCar(Product product) {
		return repo.insertCar(product);
	}

	/* 상품 전체 조회 */
	public List<Product> selectProducts() {
		return repo.selectProducts();
	}

	/* 일련번호로 상품조회 */
	public Product selectProductBySeq(String productSeq) {
		return repo.selectProductBySeq(productSeq);
	}

	/* 필터조건으로 차량조회 */
	public List<Product> selectCarByFilter(HashMap<String, String> productSeq) {
		return repo.selectCarByFilter(productSeq);

	}

	/* 일련번호로 차량조회 */
	public Product selectCarBySeq(String productSeq) {
		return repo.selectCarBySeq(productSeq);
	}

	/* 카테고리로 상품조회 */
	public List<Product> selectProductByCategory(String category) {
		return repo.selectProductByCategory(category);
	}
}
