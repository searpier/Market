package carrot.market.test.model;

/**
 * @Author : 전상수
 * @Date : 2019. 11. 08.
 * @Class 설명 : 당근마켓 제품모델
 * 
 */
public class Product {

	/* 기본상품정보 */
	private String productseq;
	private String email;
	private String title;
	private String category;
	private int price;
	private String description;
	private String created_at;
	private String updated_at;
	private String image;
	private int diffDays;

	/* 차종류관련 */
	private String carseq;
	private String madedate;
	private int randistance;
	private String issmoke;

	public Product() {
		super();
	}

	public Product(String productseq, String email, String title, String category, int price, String description,
			String created_at, String updated_at, String image, String carseq, String madedate, int randistance,
			String issmoke) {
		super();
		this.productseq = productseq;
		this.email = email;
		this.title = title;
		this.category = category;
		this.price = price;
		this.description = description;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.image = image;
		this.carseq = carseq;
		this.madedate = madedate;
		this.randistance = randistance;
		this.issmoke = issmoke;
	}

	public String getProductseq() {
		return productseq;
	}

	public void setProductseq(String productseq) {
		this.productseq = productseq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCarseq() {
		return carseq;
	}

	public void setCarseq(String carseq) {
		this.carseq = carseq;
	}

	public String getMadedate() {
		return madedate;
	}

	public void setMadedate(String madedate) {
		this.madedate = madedate;
	}

	public int getRandistance() {
		return randistance;
	}

	public void setRandistance(int randistance) {
		this.randistance = randistance;
	}

	public String getIssmoke() {
		return issmoke;
	}

	public void setIssmoke(String issmoke) {
		this.issmoke = issmoke;
	}

	public int getDiffDays() {
		return diffDays;
	}

	public void setDiffDays(int diffDays) {
		this.diffDays = diffDays;
	}

	@Override
	public String toString() {
		return "Product [productseq=" + productseq + ", email=" + email + ", title=" + title + ", category=" + category
				+ ", price=" + price + ", description=" + description + ", created_at=" + created_at + ", updated_at="
				+ updated_at + ", image=" + image + ", carseq=" + carseq + ", madedate=" + madedate + ", randistance="
				+ randistance + ", issmoke=" + issmoke + "]";
	}

}