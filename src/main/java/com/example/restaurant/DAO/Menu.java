package com.example.restaurant.DAO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Menu {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = true)
  private String foodName;

  @Column(nullable = true)
  private String category;

  @Column(nullable = true)
  private float price;

  @Column(nullable = true)
  private int quantity;

  public Menu() {
  }

  public Menu(String foodName, String category, float price, int quantity) {
    this.foodName = foodName;
    this.category = category;
    this.price = price;
    this.quantity = quantity;
  }

  public Long getFoodID() {
    return this.id;
  }

  public void setFoodID(Long id) {
    this.id = id;
  }

  public String getFoodName() {
    return this.foodName;
  }

  public void setFoodName(String foodName) {
    this.foodName = foodName;
  }

  public String getCategory() {
    return this.category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public float getPrice() {
    return this.price;
  }

  public void setPrice(float price) {
    this.price = price;
  }

  public int getQuantity() {
    return this.quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  @Override
  public String toString() {
    return "{" +
      " id='" + getFoodID() + "'" +
      ", foodName='" + getFoodName() + "'" +
      ", category='" + getCategory() + "'" +
      ", price='" + getPrice() + "'" +
      ", quantity='" + getQuantity() + "'" +
      "}";
  }

}









