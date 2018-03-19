package com.light.shop.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class ProductDetailInfo implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long productId;
	private String photo;
	private Timestamp createtime;
	private Integer type;
	private String description;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}

