package carrot.market.test.repository;

import java.util.HashMap;
import java.util.List;

import carrot.market.test.model.Product;
import carrot.market.test.model.User;
/**
 * @Author : 전상수
 * @Date : 2019. 11. 08.
 * @Class 설명 : 당근마켓 Data Access Object
 * 
 */
public interface MarketDAO {

	/* 회원등록 */
	public int insertUser(User user);

	/* 회원로그인 */
	public User selectUser(User user);

	/* 상품등록 */
	public int insertProduct(Product product);

	/* 차량등록 */
	public int insertCar(Product product);

	/* 일련번호로 상품조회 */
	public Product selectProductBySeq(String productSeq);
	
	/* 상품 전체 조회 */
	public List<Product> selectProducts();

	/* 일련번호로 차량조회 */
	public Product selectCarBySeq(String productSeq);

	/* 필터조건으로 차량조회 */
	public List<Product> selectCarByFilter(HashMap<String,String> productSeq);
	
	/* 카테고리로 상품조회 */
	public List<Product> selectProductByCategory(String category);
}
